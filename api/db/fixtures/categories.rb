# categoriesの初期値として、nameがバックエンド、フロントエンド、インフラの3つのカテゴリーを作成する
Category.seed(:name,
              { name: 'バックエンド' },
              { name: 'フロントエンド' },
              { name: 'インフラ' }
)
