class WelcomeController < ApplicationController
  def index
    @followers_activity = FollowerEventSearch.new(current_user.username, current_user)
  end
end
