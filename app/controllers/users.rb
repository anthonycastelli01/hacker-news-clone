get '/users/login' do
  erb :'_login_form', layout: false
end

post '/sessions/create' do
  user = User.find_by_username(params[:username])
  puts "*" * 60
  puts "Creating session..."
  if user.nil?
    puts "*" * 60
    puts "NOPE"
    return "<p>Sorry, those aren't the right values.</p>"
  elsif user.password == params[:password]
    puts "*" * 60
    puts "GOOD JOB"
    session[:user_id] = user.id
    return "<p>Welcome, #{user.username}!</p>"
  else
    puts "*" * 60
    puts "WTF"
    return "<p>I have no idea what you just did.</p>"
  end
end

get '/users/new' do
  erb :'_registration_form', layout: false
end