class User < ApplicationRecord

  def test_by_level(level)
    Test.joins('INNER JOIN users_tests ON user_test.test_id = tests.id').where('tests.level = :level', level: level).where(users_tests: { user_id: self.id })
  end
end
