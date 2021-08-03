module QuestionsHelper
  def question_header(question)
    action = question.new_record? ? 'Create' : 'Edit'
    "#{action} question for test «#{question.test.title}»"
  end

  def question_nav(question)
    to_test = link_to 'Back to test', test_path(question.test)
    to_all_tests = link_to 'Back to all tests', tests_path
    to_test + ' | ' + to_all_tests
  end
end
