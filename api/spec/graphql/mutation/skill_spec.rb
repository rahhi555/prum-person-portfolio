require 'rails_helper'

RSpec.describe 'Skill関連のMutation', type: :request do
  describe 'createSkill Mutation' do
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let(:query) do
      <<~QUERY
        mutation {
          createSkill(input: {
            skillInput: {
              categoryId: #{category.id}
              level: 1
              name: "Ruby"
            }
          }) {
            skill {
              id
            }
          }
        }
      QUERY
    end

    it 'ログイン済みの場合、スキルを作成できること' do
      expect do
        post graphql_path, params: { query: }, headers: { Authorization: "Bearer #{user.create_jwt_token}" }
      end.to change(Skill, :count).by(1)
      skill_id = response.parsed_body['data']['createSkill']['skill']['id']
      expect(skill_id).to eq Skill.last.id.to_s
    end

    it 'ログインしていない場合、エラーが返ってくること' do
      expect do
        post graphql_path, params: { query: }
      end.not_to change(Skill, :count)

      expect_not_login
    end
  end
end
