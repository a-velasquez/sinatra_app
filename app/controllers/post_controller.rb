class PostController < ApplicationController

  #create

  get '/posts/new' do
    erb :'/posts/new'
  end

  post '/posts' do #.create also saves the created object, while .build only returns the new object.
    @post = Post.create(content: params[:content])
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
