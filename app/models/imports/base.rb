class Imports::Base < ActiveRecord::Base
  self.table_name = 'imports'

  belongs_to :user

  has_many :snapshots, dependent: :destroy, foreign_key: 'import_id'

  has_attached_file :file, default_url: '/imports/:filename'

  validates_attachment :file, presence: true,
                              content_type: { content_type: 'text/csv' }

  serialize :necessary_columns, Array
  serialize :headers, Array

  attr_accessor :type_of_import

  state_machine :state, initial: :not_imported do
    event :load_in_progress do
      transition not_imported: :loading
    end

    event :import_in_progress do
      transition loading: :importing
    end

    event :failed_load do
      transition loading: :failed_load
    end

    event :failed_import do
      transition importing: :failed_import
    end

    event :finish_import do
      transition importing: :imported
    end
  end

  def make_snapshots
    self.snapshots << Snapshot.make(parsed_csv)
    self.headers = parsed_csv.headers
    self.snapshots_count = snapshots.size
    import_in_progress!
    snapshots.each { |snapshot| snapshot.import_product }
    finish_import!
    save
  end

  private

  def parsed_csv
    @parsed_csv ||= begin
      data = File.open(file.path)
      @parsed_csv = CSV.parse(data, headers: true)
    end
  end
end
