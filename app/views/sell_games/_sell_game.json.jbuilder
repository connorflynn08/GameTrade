json.extract! sell_game, :id, :title, :price, :string, :description, :user_id, :created_at, :updated_at
json.url sell_game_url(sell_game, format: :json)
