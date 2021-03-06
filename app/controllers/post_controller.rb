class PostController < ApplicationController

  #create
  get '/posts/new' do
    if logged_in? #checks to see if user is logged in
      erb :'/posts/new' #if logged in, lets user see new post form
    else
      flash[:message] = "You must be logged in to add a new post"
      redirect '/login' #if not logged in, takes user to login page
    end
  end

  post '/posts' do
    if logged_in?
    @post = current_user.posts.create(content: params[:content], posted: Time.now) #.create also saves the created object, while .build only returns the new object.
      if @post.save
        flash[:message] = "You've successfully added a movie to your collection!"
        redirect "/posts/#{@post.id}"
      else
        flash[:errors]  = "Post Was Not Saved: #{@post.errors.full_messages.to_sentence}"
        redirect '/posts/new'
      end
    else
      redirect '/login'
    end
  end

  #read all
  get '/posts' do
    if logged_in?
      @user = current_user
      @posts = @user.posts.all
      erb :'/posts/index'
    else
      redirect '/login'
    end
  end

  #read a specific instance
  get '/posts/:id' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      if @post.user_id == session[:user_id]
        erb :'/posts/show'
      else
        redirect '/posts'
      end
    else
      redirect '/login'
    end
  end

  #update
  get '/posts/:id/edit' do
    if logged_in?
      @post = current_user.posts.find_by(id: params[:id])
      erb :'posts/edit'
    else
      redirect '/login'
    end
  end

  patch '/posts/:id' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
        if @post && @post.user == current_user
          @post.content = params[:content]
          @post.save
          redirect "/posts/#{@post.id}"
        else
          redirect "/posts/#{@post.id}"
        end
    else
      redirect to '/login'
    end
  end


  #delete
  delete '/posts/:id/delete' do
    @post = current_user.posts.find_by_id(params[:id])
    if @post && @post.destroy
      redirect '/posts'
    else
      redirect '/posts/#{@post.id}'
    end
  end


end
