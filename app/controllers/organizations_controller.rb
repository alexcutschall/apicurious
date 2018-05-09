class OrganizationsController < ApplicationController
  def index
    @search = OrganizationSearch.new(current_user)
  end
end
