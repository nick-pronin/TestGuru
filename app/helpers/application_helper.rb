module ApplicationHelper
  def github_url(author, repo)
    link_to("Проект TestGuru", "https://github.com/#{author}/#{repo}", target: "_blank", class: "white-link")
  end
end
