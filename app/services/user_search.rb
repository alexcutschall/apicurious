class UserSearch
  def initialize(name, current_user)
    @name = name
    @current_user = current_user
  end

  def user
    # make an api call
    conn = Faraday.new(url: "https://api.github.com/users/#{name}")

    response = conn.get do |req|
      req.headers['Authorization'] = "token " + current_user.oauth_token
    end

    raw_search = JSON.parse(response.body, symbolize_names: true)

    user = GithubUser.new(raw_search)
  end

  def name
    @name.delete(" ").downcase
  end

  private
  attr_reader :current_user

end
