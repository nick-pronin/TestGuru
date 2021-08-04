module TestsHelper

  TEST_LEVELS = { 0..1 => :beginner, 2..4 => :middle }.freeze

  def back_to_tests
    link_to 'Back', tests_path
  end

  def test_level(test)
    TEST_LEVELS.select { |test_level| test_level === test.level }.values.first || :professor
  end
end
