class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category

  def self.add_post(params)
    new_post = Post.create(params)
    new_post.key = Post.generate_key
    new_post.save
    new_post
  end

  def self.generate_key
    rand(1..10000)
  end

  def self.valid?(id, key)
    return Post.exists?(id) && Post.find(id).key == key
  end

  def self.change_post(id, params)
    Post.update(id,:title => params[:title], :description => params[:description],
      :category_id => params[:category_id].to_i, :price => params[:price], :email =>
      params[:email])
  end
end
