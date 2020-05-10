class UserController < ApplicationController

#signing up
  get '/signup' do
    if logged_in?
      redirect to '/posts'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    if is_logged_in?
      # flash[:message] = "You were already logged in. Here are your reviews."
      redirect to '/posts'
    elsif params[:username] == "" || params[:password] == ""
      # flash[:message] = "In order to sign up for account, you must have both a username & a password. Please try again."
      redirect to '/signup'
    else
      @user = User.create(username: params[:username], password: params[:password])
      @user.save
      session[:critic_id] = @user.id #logged in. where is the sessions hash initially declared?
      redirect to '/signup'
    end
  end

#logging in

end
