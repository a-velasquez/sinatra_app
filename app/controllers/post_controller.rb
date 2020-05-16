class PostController < ApplicationController

  #create

  get '/posts/new' do
    if logged_in? #checks to see if user is logged in
      erb :'/posts/new' #if logged in, lets user see new post form
    else
      redirect '/login' #if not logged in, takes user to login page
    end
  end

  post '/posts' do #.create also saves the created object, while .build only returns the new object.
    if logged_in?
      if params[:content] == ""
        redirect "/posts/new"
      else
        @post = current_user.posts.create(content: params[:content])# creates post and sets association.
        if @post
          redirect "/posts/#{@post.id}"
        else
          redirect "/tweets/new"
        end
      end
    else
      redirect "/login"
    end
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
