class Event
  attr_reader :type,
              :display_login,
              :repo_name,
              :commit_name,
              :pull_request_name

  def initialize(information)
    @type = information[:type]
    @display_login = information[:actor][:display_login]
    @repo_name = information[:repo][:name]
    @commit_name = information[:payload][:commits][0][:message] if information[:payload][:commits]
    @pull_request_name = information[:payload][:pull_request][:title] if information[:payload][:pull_request]
  end
end
