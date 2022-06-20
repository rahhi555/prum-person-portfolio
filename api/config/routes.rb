# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :file_upload do
    post :user
  end
  post '/graphql', to: 'graphql#execute'
  get '/health-check', to: 'health_check#index'
end
