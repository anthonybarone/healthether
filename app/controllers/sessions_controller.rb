class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
      #session[:user_id] = user.id 'prior to implementing remember me & reset password
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    #session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url, notice: "Logged out!"
  end
end
