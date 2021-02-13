class CreateTrans < ActiveRecord::Migration[6.1]
  def change
    create_table :trans do |t|
      t.string :title
      t.integer :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
