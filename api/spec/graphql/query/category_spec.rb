require 'rails_helper'

RSpec.describe 'Category関連 Query', type: :request do
  describe 'categories Query' do
    let(:user) { create(:user) }
    let!(:categories) { create_list(:category, 3) }
    let(:query) do
      <<~QUERY
        {
          categories {
            id
            name
          }
        }
      QUERY
    end

    it 'ログイン済みの場合、カテゴリーが返ってくること' do
      post graphql_path, params: { query: }, headers: { Authorization: "Bearer #{user.create_jwt_token}" }

      ids = response.parsed_body['data']['categories'].pluck('id')
      expect(ids).to eq categories.pluck(:id).map(&:to_s)
    end

    it 'ログインしていない場合、カテゴリーが返ってこないこと' do
      post graphql_path, params: { query: }
      expect_not_login
    end
  end
end
