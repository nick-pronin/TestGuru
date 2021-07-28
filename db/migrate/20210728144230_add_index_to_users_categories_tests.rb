class AddIndexToUsersCategoriesTests < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, :title, unique: true
    add_index :categories, :title, unique: true
    add_index :users, :email, unique: true
  end
end
