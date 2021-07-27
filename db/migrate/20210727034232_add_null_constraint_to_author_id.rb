class AddNullConstraintToAuthorId < ActiveRecord::Migration[6.1]
  def change
    change_column_null :tests, :author_id, false
  end
end
