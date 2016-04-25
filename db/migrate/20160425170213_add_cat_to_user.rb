class AddCatToUser < ActiveRecord::Migration
  def change
    add_reference :users, :cat, index: true, foreign_key: true
  end
end
