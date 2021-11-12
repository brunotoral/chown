# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!

  private

  def paginate(collection)
    @pagy, paginated_collection = pagy(collection)

    paginated_collection
  end

  def after_sign_in_path_for(_resource)
    people_path
  end
end
