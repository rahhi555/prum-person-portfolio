# インストロペクションのjson非表示
GraphQL::RailsLogger.configure do |config|
  config.skip_introspection_query = true
end
