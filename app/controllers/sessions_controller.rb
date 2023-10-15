class SessionsController < ApplicationController
 
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      # SMaintin user's State in the application
      session[:user_id] = user.id
      redirect_to '/'
    else
    # redirect if the user cannot be authenticated.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
