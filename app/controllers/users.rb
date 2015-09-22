post '/sessions/create' do
  user = User.find_by_username(params[:username])
  if user.nil?
    redirect '/'
  elsif user.password == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{session[:user_id]}"
  else
    redirect '/'
  end
end