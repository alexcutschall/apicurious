class RepositoriesController < ApplicationController
  def index
    @search_user = UserSearch.new(current_user.username, current_user)
    @search = RepositorySearch.new(current_user)
  end

  def show
    @created_repo = RepositoryCreation.new(params, current_user)
    redirect_to root_path
  end
end

class RepositoryCreation
  def initialize(params, current_user)
    @current_user = current_user
    @name = params[:name]
    @description = params[:description] if params[:description]
    creation
  end

  def creation
    conn = Faraday.new(url: "https://api.github.com/user/repos")
    posted = conn.post do |req|
      req.headers['Authorization'] = "token " + current_user.oauth_token
      req.headers['Content-Type'] = 'application/json'
      req.body = '{ "name": "Umagi" }'
    end

    response = JSON.parse(posted.body)
  end

  private
  attr_reader :current_user,
              :name,
              :description
end
