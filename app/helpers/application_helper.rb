module ApplicationHelper
  def github_url(author, repo)
    link_to("Проект TestGuru", "https://github.com/#{author}/#{repo}", target: "_blank")
  end

  def test_nav(test)
    to_test = link_to 'Back to test', test_path(test)
    to_all_tests = link_to 'Back to all tests', tests_path
    to_test + ' | ' + to_all_tests
  end
end
