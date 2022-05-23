# frozen_string_literal: true

class HealthCheckController < ApplicationController
  def index
    render plain: 'The api health check was OK', status: :ok
  end
end
