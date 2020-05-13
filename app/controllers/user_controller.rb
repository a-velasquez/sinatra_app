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
    if logged_in?
      # flash[:message] = "You were already logged in. Here are your reviews."
      redirect to '/posts'
    elsif params[:username] == "" || params[:password] == ""
      # flash[:message] = "In order to sign up for account, you must have both a username & a password. Please try again."
      redirect to '/signup'
    else
      @user = User.create(username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id #sets session id / logs user in
      redirect to '/signup'
    end
  end

#Logging in

  get '/login' do
    if logged_in?
      redirect '/posts'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/posts'
    else
      redirect '/login'
    end
  end

  #logging out

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

end
