module TestsHelper

  TEST_LEVELS = {0..1 => I18n.t('helpers.test.beginner'), 2..4 => I18n.t('helpers.test.middle')}.freeze

  def back_to_tests
    link_to t('helpers.test.back'), tests_path
  end

  def test_level(test)
    TEST_LEVELS.select { |test_level| test_level === test.level }.values.first || I18n.t('helpers.test.professor')
  end

  def tests_header(test)
    action = test.new_record? ? t('helpers.test.create') : t('helpers.test.edit')
    "#{action}"
  end
end
