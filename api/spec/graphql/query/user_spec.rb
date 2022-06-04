require 'rails_helper'

RSpec.describe 'User関連Query', type: :request do
  describe 'users Query' do
    let!(:users) { create_list(:user, 3) }

    it '全ユーザーが取得できること' do
      query = <<~QUERY
        {
          users {
            id
            email
            profile
            createdAt
            updatedAt
          }
         }
      QUERY

      post graphql_path, params: { query: }
      json = response.parsed_body
      expect(json['data']['users'].length).to eq users.length
    end
  end

  describe 'current_user Query', type: :request do
    let(:user) { create(:user) }
    let(:query) do
      <<~QUERY
        {
          currentUser {
            id
          }
        }
      QUERY
    end

    it 'ヘッダーにBearerトークンが存在する場合、現在のユーザーを取得できること' do
      token = user.create_jwt_token
      post graphql_path, params: { query: }, headers: { Authorization: "Bearer #{token}" }
      id = response.parsed_body['data']['currentUser']['id']
      expect(id).to eq user.id.to_s
    end

    it 'ヘッダーにBearerトークンが存在しない場合、エラーが返ってくること' do
      expect_not_login(query)
    end
  end
end
