class SessionsController < ApplicationController
  skip_forgery_protection only: :create

  def new
    render :new
  end

  def create
    user_info = request.env['omniauth.auth']
    raise user_info # Your own session management should be placed here.
  end
end
