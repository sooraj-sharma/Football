class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :mp
      t.integer :won
      t.integer :draw
      t.integer :lose
      t.integer :gf
      t.integer :ga
      t.integer :gd
      t.integer :points

      t.timestamps
    end
  end
end
