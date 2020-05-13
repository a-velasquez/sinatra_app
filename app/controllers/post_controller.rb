class PostController < ApplicationController

  #create

  get '/post/new' do

  end




  #read all
  get '/posts' do
    if logged_in?
      @user = current_user
      @posts = @user.posts.all
      erb :'users/index'
    else
      redirect '/login'
    end
  end

  #update



  #delete



end
