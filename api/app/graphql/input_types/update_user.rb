module InputTypes
  class UpdateUser < Types::BaseInputObject
    description 'ユーザー更新に必要な項目'
    argument :profile, String, required: true, description: 'プロフィールテキスト'
  end
end
