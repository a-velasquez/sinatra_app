## Application Function
    [] - User can create, read, update and delete a post

## Interface:
    - User can view post form
    - User can submit post form
    - User can edit post
    - User can delete post

## User class
    - attributes => username, email, password
    - user signs up/logs in
    - has many posts

## User controller and views
    - '/users/signup' => renders signup form
    - '/users/signup' => processes signup from,. creates user, POST
    - 'users/login' => renders login form
    - 'users/login' => processes login form, POST
    - need to set session to login user
    - user can view their posts, '/users/:id/posts'

## Post class
    - attributes => content, user_id
    - post belongs to user

## Post controller and views
    - '/posts/new' => renders new post form
    - '/posts' => submits posts, POST
    - '/posts' => renders all orders
    - '/posts/:id' => renders one instance of Post
    - '/posts/:id/edit' => renders update form for an instance
    - '/posts/:id' => update instance, PATCH
    - '/posts/:id/delete' => deletes instance

## Where To Start?
    [] - setup classes
    [] - set up database
    [] - user_controller
    [] - post_controller
