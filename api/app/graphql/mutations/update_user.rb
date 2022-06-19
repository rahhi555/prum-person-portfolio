module Mutations
  class UpdateUser < BaseLoginRequireMutation
    description 'ユーザープロフィール更新'

    field :user, ObjectTypes::User, null: false, description: '更新後ユーザー'

    argument :update_user_input, InputTypes::UpdateUser, required: true, description: '更新に必要な項目'

    def resolve(update_user_input:)
      update_user_input.to_hash => { profile: }
      user = context[:current_user]
      raise GraphQL::ExecutionError, user.errors.full_messages unless user.update(profile:)

      { user: }
    end
  end
end
