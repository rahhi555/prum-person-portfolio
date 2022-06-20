class FileUploadController < ApplicationController
  before_action :logged_in_user

  def user
    @current_user.avatar.attach(params[:avatar])
    render json: { id: @current_user.id.to_s, avatar: @current_user.avatar_url }, status: :ok
  end

  private

  # ユーザーのログイン確認
  def logged_in_user
    @current_user = current_user
    render plain: I18n.t('graphql.errors.messages.not_login'), status: :unauthorized unless @current_user
  end
end
