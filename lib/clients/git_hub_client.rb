require 'octokit'

class GitHubClient

  # ROOT_ENDPOINT = 'https://api.github.com'
  # ACCESS_TOKEN = 'e1bd460da62a6f74d2a2fe997a5771067d6c57bf'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

end
