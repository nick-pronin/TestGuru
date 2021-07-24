class User < ApplicationRecord

  def test_by_level(level)
    Test.joins('INNER JOIN results ON results.test_id = tests.id').where('tests.level = :level', level: level).where(results: { user_id: self.id })
  end
end
