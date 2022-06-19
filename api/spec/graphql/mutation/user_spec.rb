require 'rails_helper'

RSpec.describe 'User関連のMutation', type: :request do
  describe 'createUser Mutation' do
    let(:new_user) { build(:user) }

    it '新たにuserを作成できること' do
      query = <<~QUERY
        mutation {
          createUser(input: {
            authInput: {
              email: "#{new_user.email}"
              password: "#{new_user.password}"
            }
          }) {
            user {
              email
            }
          }
        }
      QUERY

      expect do
        post graphql_path, params: { query: }
      end.to change(User, :count).by(1)
      parsed_data[:createUser][:user] => { email: }
      expect(email).to eq new_user.email
    end
  end

  describe 'login Mutation' do
    let!(:registered_user) { create(:user) }

    def query(email, password)
      <<~QUERY
        mutation {
          login(input: {
            authInput: {
              email: "#{email}"
              password: "#{password}"
            }
          }) {
            user {
              id
            }
            jwt
          }
        }
      QUERY
    end

    it 'ログインできること' do
      post graphql_path, params: { query: query(registered_user.email, registered_user.password) }
      parsed_data[:login] => { user:, jwt: }
      decoded_token = JWT.decode jwt, Rails.application.credentials.secret_key_base

      expect(user[:id]).to eq registered_user.id.to_s
      expect(decoded_token).to include('user_id' => registered_user.id)
    end

    it '無効な属性値の場合、ログインに失敗すること' do
      post graphql_path, params: { query: query('hoge', 'fuga') }

      expect(parsed_data[:login]).to be_nil

      message = response.parsed_body['errors'][0]['message']
      expect(message).to eq I18n.t('graphql.errors.messages.failed_auth')
    end
  end

  describe 'updateUser Mutation' do
    let(:registered_user) { create(:user) }
    let(:new_profile) { 'new profile' }
    let(:query) do
      <<~QUERY
        mutation {
          updateUser(input: {
            updateUserInput: {
              profile: "#{new_profile}"
            }
          }) {
            user {
              id
              profile
            }
          }
        }
      QUERY
    end

    it 'ログイン済みの場合、ユーザーを更新できること' do
      post graphql_path, params: { query: }, headers: { Authorization: "Bearer #{registered_user.create_jwt}" }
      parsed_data[:updateUser][:user] => { id:, profile: }
      expect(id).to eq registered_user.id.to_s
      expect(profile).to eq new_profile
    end

    it 'ログインしていない場合、エラーが返ってくること' do
      post graphql_path, params: { query: }

      expect_not_login
    end
  end
end
