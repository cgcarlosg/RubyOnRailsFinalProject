class RemoveCategoryIdFromTrans < ActiveRecord::Migration[6.1]
  def change
    remove_column :trans, :category_id, :integer
  end
end
