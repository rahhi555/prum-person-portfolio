# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def current_user
    authenticate_with_http_token do |token|
      user_id = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]['user_id']
      User.find_by(id: user_id)
    end
  end
end
