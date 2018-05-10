class UsersController < ApplicationController
  def show
    @search = UserSearch.new(params[:id], current_user)
    @event_search = EventSearch.new(params[:id], current_user)
    @followers_activity = FollowerEventSearch.new(params[:id], current_user)
  end
end
