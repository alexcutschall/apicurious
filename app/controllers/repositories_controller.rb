class RepositoriesController < ApplicationController
  def index
    @search = RepositorySearch.new(current_user)
  end
end


class RepositorySearch

  def initialize(current_user)
    @current_user = current_user
  end

  def repositories
    connection = Faraday.new(url: "https://api.github.com/user/repos")
    response = connection.get do |req|
      req.headers['Authorization'] = "token " + current_user.oauth_token
    end

    raw_search = JSON.parse(response.body, symbolize_names: true)

    raw_search.map do |information|
      Repository.new(information)
    end
  end

  private
  attr_reader :current_user

end

class Repository
  attr_reader :name,
              :url

  def initialize(attributes)
    @name = attributes[:name]
    @url = attributes[:html_url]
  end
end
