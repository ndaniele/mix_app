class SessionsController < ApplicationController

  def new
  end

  def create
    #raise cookies.inspect
    #raise params.inspect
    if auth_hash = request.env["omniauth.auth"]
    raise auth_hash.inspect
      #then user has logged in via omniauth
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if 
        user = User.find_by(:email => oauth_email)
        session[:user_id] = user.id
        redirect_to root_path
      else
        user = User.new(:email => oauth_email, :password => SecureRandom.hex)
        if user.save
          session[:user_id] = user.id
          redirect_to root_path
        else
          raise user.errors.full_messages.inspect
        end
      end
    else 
      #normal login via username and password
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render 'sessions/new'
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
