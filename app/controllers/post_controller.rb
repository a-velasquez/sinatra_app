class PostController < ApplicationController

  #create

  get '/posts/new' do
    if logged_in?
      erb :'/posts/new'
    else
      redirect '/login'
    end
  end

  post '/posts' do #.create also saves the created object, while .build only returns the new object.
    @post = current_user.posts.create(content: params[:content]) # creates post and sets association.
    binding.pry
  end

  #read all
  get '/posts' do
    if logged_in?
      @user = current_user
      @posts = @user.posts.all
      erb :'posts/index'
    else
      redirect '/login'
    end
  end

  #update



  #delete



end
