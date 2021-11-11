# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  layout :layout_by_resource

  before_action :authenticate_user!

  private

  def paginate(collection)
    @pagy, paginated_collection = pagy(collection)

    paginated_collection
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end
