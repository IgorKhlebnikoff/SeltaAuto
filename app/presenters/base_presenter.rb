class BasePresenter
  attr_reader :object, :template

  def initialize(object, template, params = {})
    @object = object
    @template = template
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
      self.class.class_eval do
        send(:attr_reader, key)
      end
    end if params.any?
  end
end

