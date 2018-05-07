class UsersController < ApplicationController
  def show
    render text: request.env["omniauth.auth"]
    binding.pry
  end
end
