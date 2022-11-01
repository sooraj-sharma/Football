json.extract! team, :id, :name, :mp, :won, :draw, :lose, :gf, :ga, :gd, :points, :created_at, :updated_at
json.url team_url(team, format: :json)
