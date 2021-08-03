module ApplicationHelper
  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
