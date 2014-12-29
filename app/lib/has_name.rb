module HasName
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def full_name
      [first_name, last_name].join(' ')
    end
  end
end
