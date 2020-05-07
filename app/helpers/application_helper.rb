module ApplicationHelper
  def now_year
    DateTime.now.year
  end

  def github_link(author, repo)
    link_to block_given? ? yield : repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
