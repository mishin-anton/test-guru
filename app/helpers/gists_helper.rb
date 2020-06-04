module GistsHelper

  def gist_url(data)
    link_to data, "#{data}", target: :blank
  end

end
