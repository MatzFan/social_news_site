class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :article_id, presence: true
  validates :user_id, presence: true
end
