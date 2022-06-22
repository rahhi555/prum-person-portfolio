require 'rails_helper'

RSpec.describe 'Category関連 Query', type: :request do
  describe 'categories Query' do

    # 最初からカテゴリは３つある
    let!(:categories) { create_list(:category, 3) }

    # 3つのうち1つのみスキルを持つ
    let(:category_own_skills) { categories[0] }

    # 現在のユーザーとそのスキル
    let(:user) { create(:user) }
    let!(:skills) { create_list(:skill, 3, user:, category: category_own_skills) }

    # 別ユーザーのスキル
    let!(:other_skills) { create_list(:skill, 3, category: category_own_skills) }

    let(:query) do
      <<~QUERY
        {
          categories {
            id
            name
            skills {
              id
              user {
                id
              }
            }
          }
        }
      QUERY
    end

    context 'ログイン済みの場合' do
      let(:auth_header) do
        { Authorization: "Bearer #{user.create_jwt}" }
      end

      it 'カテゴリーが返ってくること' do
        post graphql_path, params: { query: }, headers: auth_header

        ids = parsed_data[:categories].pluck(:id)
        expect(ids).to eq categories.pluck(:id).map(&:to_s)
      end

      it 'ユーザーとそのユーザーのスキルが返ってくること' do
        post graphql_path, params: { query: }, headers: auth_header

        res_category_own_skills = parsed_data[:categories].find do |category|
          category[:id] == category_own_skills.id.to_s
        end

        ids = res_category_own_skills[:skills].pluck(:id)
        expect(ids).to eq skills.pluck(:id).map(&:to_s)

        user_ids = res_category_own_skills[:skills].map { |skill| skill[:user][:id] }
        expect(user_ids).to be_all(user.id.to_s)
      end
    end

    context 'ログインしていない場合' do
      it 'カテゴリーが返ってこないこと' do
        post graphql_path, params: { query: }
        expect_not_login
      end
    end
  end
end
