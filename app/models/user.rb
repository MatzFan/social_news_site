class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # added this for Twitter access
         :omniauthable

  has_many :articles

  def self.twitter_auth(auth_hashh)
    # see gem omniauth-twitter docs for this:-
    user = find_or_create_by(uid: auth[:uid], provider: :twitter) do |user|
      user.name = auth[:info][:name]
      user.password = pwd
      user.password_confirmation = pwd
      twitter_hash = request.env['omniauth.auth'] # gets auth hash from Twitter
    end
  end

  def email_required? # overides Warden method???????????????????
    return false if provider == 'twitter'
    super # CALLS WHAT????????????
  end

end # of class
