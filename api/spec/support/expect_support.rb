module ExpectSupport
  def expect_not_login
    expect(response.parsed_body['errors'][0]['message']).to eq I18n.t('graphql.errors.messages.not_login')
  end
end
