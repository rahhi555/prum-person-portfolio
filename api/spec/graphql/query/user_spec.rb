require 'rails_helper'

RSpec.describe 'User関連Query', type: :request do
  describe 'current_user Query', type: :request do
    let(:user) { create(:user) }
    let!(:skills) { create_list(:skill, 3, user:) }
    let(:query) do
      <<~QUERY
        {
          currentUser {
            id
            email
            profile
            skills {
              id
              category {
                id
              }
            }
          }
        }
      QUERY
    end

    context 'ヘッダーにBearerトークンが存在する場合' do
      let(:auth_header) do
        { Authorization: "Bearer #{user.create_jwt}" }
      end

      it '現在のユーザーを取得できること' do
        post graphql_path, params: { query: }, headers: auth_header
        parsed_data[:currentUser] => { id:, email:, profile: }
        expect(id).to eq user.id.to_s
        expect(email).to eq user.email
        expect(profile).to eq user.profile
      end

      it 'ユーザーが保有しているスキル一覧及びカテゴリを取得できること' do
        post graphql_path, params: { query: }, headers: auth_header

        res_skills = parsed_data[:currentUser][:skills]
        expect(res_skills.pluck(:id)).to eq skills.pluck(:id).map(&:to_s)

        categories = res_skills.pluck(:category)
        expect(categories.pluck(:id)).to eq skills.pluck(:category_id).map(&:to_s)
      end
    end

    context 'ヘッダーにBearerトークンが存在しない場合' do
      it 'エラーが返ってくること' do
        post graphql_path, params: { query: }
        expect_not_login
      end
    end
  end
end
