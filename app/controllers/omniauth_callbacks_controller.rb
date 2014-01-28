class OmniauthCallbacksController < ApplicationController

  # method added by Devise :)
  def twitter

    User.twitter_auth(request.env['omniauth.auth'])
  end

end
