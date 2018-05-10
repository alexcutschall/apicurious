class FollowerEventSearch
  def initialize(name, current_user)
    @name = name
    @current_user = current_user
  end

  def events
    connection = Faraday.new(url: "https://api.github.com/users/#{name}/received_events")
    response = connection.get do |request|
      request.headers['Authorization'] = "token " + current_user.oauth_token
    end

    raw_search = JSON.parse(response.body, symbolize_names: true)

    events = raw_search.map do |information|
      FollowerEvent.new(information)
    end
  end

  def name
    @name.delete(" ").downcase
  end

  private
  attr_reader :current_user
end
