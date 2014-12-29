class ImportPresenter < BasePresenter
  include Rails.application.routes.url_helpers

  def state
    if object.not_imported?
      template.link_to(I18n.t('states.start_import'), make_snapshots_import_path(object), class: 'add-content')
    else
      template.content_tag(:p, I18n.t("states.#{object.state}"))
    end
  end
end
