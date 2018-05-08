class UsersController < ApplicationController
  def show
    render text: request.env["omniauth.auth"]
  end
end
