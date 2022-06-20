require 'rails_helper'

RSpec.describe 'FileUploads', type: :request do
  describe 'POST /user' do
    let(:user) { create(:user) }

    context 'ログインしている場合' do
      it 'アバター画像がアップロードされること' do
        avatar = Rack::Test::UploadedFile.new('spec/fixtures/test_img.png')
        expect(user.avatar.attached?).to be false

        post file_upload_user_path, params: { avatar: }, headers: { Authorization: "Bearer #{user.create_jwt}" }

        expect(user.reload.avatar.attached?).to be true
        expect(response).to have_http_status(:success)
        expect(response.parsed_body['id']).to eq user.id.to_s
        expect(response.parsed_body['avatar']).to eq user.avatar_url
      end
    end

    context 'ログインしていない場合' do
      it 'ステータスコード401が返ってくること' do
        post file_upload_user_path
        expect(response).to have_http_status(:unauthorized)
        expect(response.parsed_body).to eq I18n.t('graphql.errors.messages.not_login')
      end
    end
  end
end
