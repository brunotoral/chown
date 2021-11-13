# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  private

  def paginate(collection)
    @pagy, paginated_collection = pagy(collection)

    paginated_collection
  end

  def after_sign_in_path_for(_resource)
    people_path
  end

  def user_not_authorized
    flash[:alert] = 'Você não tem permissão para executar esta ação'

    redirect_to(request.referrer || people_path)
  end
end
