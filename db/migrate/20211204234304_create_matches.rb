class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string :team_a
      t.string :team_b
      t.datetime :scheduled_on

      t.timestamps
    end
  end
end
