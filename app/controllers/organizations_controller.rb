class OrganizationsController < ApplicationController
  def index
    @search = OrganizationSearch.new(current_user)
  end
end

class OrganizationSearch
  def initialize(current_user)
    @current_user = current_user
  end

  def organizations
    connection = Faraday.new(url: "https://api.github.com/user/orgs")
    response = connection.get do |req|
      req.headers['Authorization'] = "token " + current_user.oauth_token
    end
    raw_search = JSON.parse(response.body, symbolize_names: true)
    organizations = raw_search.map do |information|
      Organization.new(information)
    end
  end

  private
  attr_reader :current_user
end

class Organization
  attr_reader :login,
              :url,
              :avatar_url


  def initialize(information)
    @login      = information[:login]
    @url        = information[:url]
    @avatar_url = information[:avatar_url]
  end
end
