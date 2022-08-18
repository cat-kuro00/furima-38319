class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item, null: false
      t.text :info, null: false
      t.integer :category, null: false
      t.integer :condition, null: false
      t.integer :shipping, null: false
      t.integer :prefecture, null: false
      t.integer :ship_days, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
