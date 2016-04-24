class AddCatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cat, :string
    add_column :users, :cat_picture, :string
  end
end
