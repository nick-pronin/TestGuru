class AddDefaultValuesToTestsAndAnswers < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:tests, :level, 1)
    change_column_default(:answers, :correct, from: nil, to: false)
  end
end