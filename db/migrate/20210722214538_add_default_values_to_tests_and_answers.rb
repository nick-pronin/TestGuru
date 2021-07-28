class AddDefaultValuesToTestsAndAnswers < ActiveRecord::Migration[6.1]
  def up
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :correct, from: nil, to: false)
  end

  def down
    change_column_default(:answers, :correct, from: false, to: nil)
  end
end
