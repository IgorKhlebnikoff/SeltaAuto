class ImportsService < BaseService
  def create_import
    import_type.create(import_params)
  end

  private

  def import_type
    "Imports::#{import_params[:type_of_import]}".constantize
  end
end
