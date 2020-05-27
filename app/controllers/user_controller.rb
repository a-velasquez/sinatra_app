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
      redirect to '/posts'
    elsif params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(username: params[:username], password: params[:password])
      if @user.save #uses validation to make sure username is unique
        session[:user_id] = @user.id #sets session id / logs user in
        redirect to '/posts'
      else
      redirect '/signup'
      end
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
      session[:user_id] = @user.id #logs user in
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
