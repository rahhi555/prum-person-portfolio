require 'rails_helper'

RSpec.describe 'User関連のMutation', type: :request do
  describe 'createUser Mutation' do
    let(:new_user) { build(:user) }

    it '新たにuserを作成できること' do
      query = <<~QUERY
        mutation {
          createUser(input: {
            userInput: {
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
end
