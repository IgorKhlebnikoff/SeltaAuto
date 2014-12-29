class AutopartsImporter
  @queue = :autoparts_queue

  def self.perform(id)
    import = Imports::Base.find(id)
    import.make_snapshots
  end
end
