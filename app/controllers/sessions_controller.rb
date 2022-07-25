class SessionsController < ApplicationController
  skip_forgery_protection only: :create

  def new
    render :new
  end

  def create
    @omniauth = request.env['omniauth.auth'].to_hash
    flash.now[:notice] = 'OmniAuth authentication successful.'
  end
end
