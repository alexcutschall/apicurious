class RepositoriesController < ApplicationController
  def index
    @search = RepositorySearch.new(current_user)
  end
end
