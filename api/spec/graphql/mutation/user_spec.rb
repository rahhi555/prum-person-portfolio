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
      user = response.parsed_body['data']['createUser']['user']
      expect(user['email']).to eq new_user.email
    end
  end

  describe 'login Mutation' do
    let!(:user) { create(:user) }

    it 'ログインできること' do
      query = <<~QUERY
        mutation {
          login(input: {
            authInput: {
              email: "#{user.email}"
              password: "#{user.password}"
            }
          }) {
            user {
              id
            }
            token
          }
        }
      QUERY

      post graphql_path, params: { query: }
      id = response.parsed_body['data']['login']['user']['id']
      token = response.parsed_body['data']['login']['token']
      decoded_token = JWT.decode token, Rails.application.credentials.secret_key_base

      expect(id).to eq user.id.to_s
      expect(decoded_token).to include('user_id' => user.id)
    end
  end
end
