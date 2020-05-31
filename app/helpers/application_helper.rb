module ApplicationHelper

  def now_year
    DateTime.now.year
  end

  def github_link(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-primary'
    }[flash_type.to_sym] || flash_type.to_s
  end

end
