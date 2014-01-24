require 'spec_helper'

describe "unauthenticated user" do

  context "trying to create a new article" do
    specify "should be redirected to /users/sign_in" do
      visit '/articles/new' # without loggin in
      expect(current_path).to eq(new_user_session_path)
    end
  end

end # of describe
