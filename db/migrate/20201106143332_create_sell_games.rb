class CreateSellGames < ActiveRecord::Migration[6.0]
  def change
    create_table :sell_games do |t|
      t.string :title
      t.string :price
      t.string :string
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
