module GistsHelper

  def gist_url(data)
    link_to data, "https://gist.github.com/#{data}"
  end

end
