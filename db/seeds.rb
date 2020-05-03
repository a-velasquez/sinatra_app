#Create users
dylan = User.create(username: "Dylan", email: "dylan@dylan.com", password: "password")
gary = User.create(username: "Gary", email: "gary@gary.com", password: "password")

#Create and Save posts
Post.create(content: "Starting the first day of 100 days of Code!", user_id: dylan.id)

Post.create(content: "Starting my Flatiron Sinatra Project!", user_id: gary.id)
