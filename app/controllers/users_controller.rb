class UsersController < ApplicationController
  def show
    @search = UserSearch.new(params[:id], current_user)
    # @timeline = TimelineSearch.new(current_user)
  end
end

# class TimelineSearch
#   def initialize(current_user)
#     @current_user = current_user
#   end
#https://api.github.com/users/alexcutschall/received_events
# end

#   def timeline
#     connection = Faraday.new(url: "https://api.github.com/feeds")
#
#     response = connection.get do |req|
#       req.headers['Authorization'] = "token " + current_user.oauth_token
#     end
#
#     user = JSON.parse(response.body, symbolize_names: true)
# binding.pry
#   end
# end

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
