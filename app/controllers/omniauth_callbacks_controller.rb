class OmniauthCallbacksController < ApplicationController

  # method added by Devise :) called by twitter upon successful authentication
  def twitter
    user = User.twitter_auth(request.env['omniauth.auth']) # gets auth hash from Twitter
    # tell Devise to sign user in and redirect
    sign_in_and_redirect user
  end

end
