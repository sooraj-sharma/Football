json.extract! player, :id, :name, :team, :postion, :matches, :goals, :created_at, :updated_at
json.url player_url(player, format: :json)
