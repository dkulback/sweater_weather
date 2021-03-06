class ApplicationController < ActionController::API
  include ExceptionHandler
  def check_location
    if params[:location].nil? || params[:location].blank?
      render json: { error: 'Location parameter is required' },
             status: :bad_request
    end
  end
end
