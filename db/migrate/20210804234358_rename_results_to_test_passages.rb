class RenameResultsToTestPassages < ActiveRecord::Migration[6.1]
  def change
    rename_table :results, :test_passages
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }
  end
end
