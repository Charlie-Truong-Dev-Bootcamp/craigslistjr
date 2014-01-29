get '/' do
  # Look in app/views/index.erb
  @list_all = Category.all
  erb :index
end

get '/category/:id' do
  # Look in app/views/index.erb
  @all_posts = Category.find(params[:id]).posts
  erb :posts_view
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :posts_detail
end

get '/create_post' do
  @list_all = Category.all
  erb :create_post
end

post '/create_post' do
  @new_post = Post.add_post(params)
  erb :show_edit_key
end

get '/edit/post/*/:key' do
  post_id = params[:splat].first.to_i
  key = params[:key].to_i
  if Post.valid?(post_id, key)
    @list_all = Category.all
    @post = Post.find(post_id)
  else
    redirect('/invalid_key')
  end
  erb :edit_post
end

post '/edit/post/*/:key' do
  post_id = params[:splat].first.to_i
  Post.change_post(post_id, params)
  redirect('/')
end

get '/invalid_key' do
  erb :edit_error
end




