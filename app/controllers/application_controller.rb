require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if logged_in?
      redirect '/posts'
    else
      erb :index
    end
  end

  def logged_in?
    !current_user.nil? #avoids double negation
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #uses memoization
  end

end
