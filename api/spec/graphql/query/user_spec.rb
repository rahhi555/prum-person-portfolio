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
end
