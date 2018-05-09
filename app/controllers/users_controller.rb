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
