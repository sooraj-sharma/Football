class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :postion
      t.integer :matches
      t.integer :goals

      t.timestamps
    end
  end
end
