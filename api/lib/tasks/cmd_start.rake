# frozen_string_literal: true

namespace :cmd do
  desc 'dockerのcmdに登録する、サーバー起動処理'
  task start: :environment do
    sh 'rails db:create'
    sh 'rails db:migrate'
    sh "bundle exec rails s -b '0.0.0.0'"
  end
end
