require 'rails_helper'

RSpec.describe 'Skill関連のMutation', type: :request do
  describe 'createSkill Mutation' do
    let!(:user) { create(:user) }
    let!(:category) { create(:category) }
    let(:query) do
      <<~QUERY
        mutation {
          createSkill(input: {
            categoryId: #{category.id}
            level: 1
            name: "Ruby"
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
        post graphql_path, params: { query: }, headers: { Authorization: "Bearer #{user.create_jwt}" }
      end.to change(Skill, :count).by(1)
      skill_id = parsed_data['createSkill']['skill']['id']
      expect(skill_id).to eq Skill.last.id.to_s
    end

    it 'ログインしていない場合、エラーが返ってくること' do
      expect do
        post graphql_path, params: { query: }
      end.not_to change(Skill, :count)

      expect_not_login
    end
  end

  describe 'updateSkill Mutation' do
    let(:skill) { create(:skill) }
    let(:query) do
      <<~QUERY
        mutation {
          updateSkill(input: {
            id: #{skill.id}
            level: #{skill.level + 1}
          }) {
            skill {
              id
              level
            }
          }
        }
      QUERY
    end

    it 'ログイン済みの場合、スキルを更新できること' do
      post graphql_path, params: { query: }, headers: { Authorization: "Bearer #{skill.user.create_jwt}" }

      id = parsed_data['updateSkill']['skill']['id']
      level = parsed_data['updateSkill']['skill']['level']
      expect(id).to eq skill.id.to_s
      expect(level).to eq skill.level + 1
    end

    it 'ログインしていない場合、エラーが返ってくること' do
      post graphql_path, params: { query: }

      expect_not_login
    end
  end
end
