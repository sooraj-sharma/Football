class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :team_a
      t.string :team_b
      t.integer :team_a_score
      t.string :team_b_score
      t.datetime :match_date

      t.timestamps
    end
  end
end
