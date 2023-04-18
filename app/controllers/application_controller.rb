class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include JsonWebToken
  before_action :authenticate_request

  private 
  def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end
end