class Article < ActiveRecord::Base

  belongs_to :user
  has_many :votes

  validates :user_id, presence: true

  def net_vote_count
    votes.upvotes.count - votes.downvotes.count
  end

end # end of class
