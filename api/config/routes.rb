# frozen_string_literal: true

Rails.application.routes.draw do
  get 'health-check', to: 'health_check#index'
end
