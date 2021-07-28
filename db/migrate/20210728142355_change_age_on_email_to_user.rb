class ChangeAgeOnEmailToUser < ActiveRecord::Migration[6.1]
  def up
    rename_column :users, :age, :email
    change_column :users, :email, :string
  end

  def down
    rename_column :users, :email, :age
    change_column :users, :age, :integer
  end
end
