class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: "User"
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :author, :content, :title, presence: true

  def points
    votes.sum(:value)
  end
end