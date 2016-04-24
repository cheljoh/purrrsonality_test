class RemoveCatsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :cat
    remove_column :users, :cat_picture
  end
end
