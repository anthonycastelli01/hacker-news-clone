User.create! [
  {username: "Madison", password: "password"},
  {username: "Jennifer", password: "password"},
  {username: "Alessandra", password: "password"},
  {username: "Anthony", password: "password"},
  {username: "Andrew", password: "password"},
  {username: "Stephanie", password: "password"}
]

20.times do
  # Generate a random ID for a user
  rand_user_id = rand(1..User.count)
  # Pull a random user from the database
  rand_user = User.find(rand_user_id)
  puts "*" * 60
  puts rand_user
  puts rand_user_id
  # Create a post with the given user ID
  #  embedded in the table, as well as a fake
  #  title and paragraph
  new_post = Post.create!(
                title: Faker::Company.catch_phrase,
                author_id: rand_user_id,
                content: Faker::Lorem.paragraph,
                created_at: Time.now - rand(20000)
              )
end

# Make a random number of votes to make
vote_count = rand(200)
# Decide on up/down voting
generate_value = [-1,1].sample

# Number of times decided on
500.times do
  # Select a random post
  rand_post = Post.find(rand(1..Post.count).floor)
  # Select a random user
  rand_user = User.find(rand(1..User.count))
  # Create a new vote with all of the values
  #  decided on by the previously defined variables
  new_vote = Vote.create!(
                votable_type: "post",
                votable_id: rand_post.id,
                value: generate_value,
                user_id: rand_user.id
              )

  rand_post.votes << new_vote
end