class CreatePostsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id
      t.datetime  :posted
    end
  end
end
