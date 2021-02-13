class CreateShopings < ActiveRecord::Migration[6.1]
  def change
    create_table :shopings do |t|
      t.string :title
      t.integer :total
      t.references :user, null: false, foreign_key: true
      t.integer :category

      t.timestamps
    end
  end
end
