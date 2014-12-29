module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def inspection_requests_link
    classes = 'new-request' if @inspection_requests_size > 0
    link_to t('.inspection_requests', count: @inspection_requests_size), inspection_requests_path, class: classes, 'ng-class' => "{'new-request': newRequestsPresent}"
  end
end
