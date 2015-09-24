class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  belongs_to :commentable, polymorphic: true

  validates :author, :text, presence: true

  def points
    votes.sum(:value)
  end
end