class Vote < ActiveRecord::Base

  belongs_to :article

  validates :article_id, presence: true

  # Rails scope method allows an object to be passed to the Proc
  scope :upvotes,  -> { where(up: true) }
  scope :downvotes,  -> { where(up: false) }

end
