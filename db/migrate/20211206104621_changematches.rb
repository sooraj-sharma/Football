class Changematches < ActiveRecord::Migration[6.1]
  def change
    rename_column:matches, :team_a, :home_team
    rename_column:matches, :team_b, :away_team
    rename_column:matches, :scheduled_on, :match_date
    add_column:matches, :location, :string
    add_column:matches, :home_team_score, :integer
    add_column:matches, :away_team_score, :integer


  end
end
