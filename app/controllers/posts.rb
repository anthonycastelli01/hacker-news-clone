get '/posts/:id' do
  puts "=" * 60
  puts "#{:id}"
  @post = Post.find(params[:id])
  erb :'post'
end