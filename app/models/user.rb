class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # added this for Twitter access
         :omniauthable

  has_many :articles

  def self.twitter_auth(auth_hash) # pass in Twitter auth hash
    # see gem omniauth-twitter docs for this:-
    user = find_or_create_by(uid: auth_hash[:uid], provider: :twitter) do |user|
      user.name = auth_hash[:info][:name]
      # dummy data for Devise so user can be signed in
      user.password = nil
      user.password_confirmation = nil
    end
  end

  def email_required? # overides Devise method
    return false if provider == 'twitter'
    super # superclass method which returns 'true'!
  end

end # of class

