get '/' do
  @posts = Post.all
  erb :'frontpage'
end