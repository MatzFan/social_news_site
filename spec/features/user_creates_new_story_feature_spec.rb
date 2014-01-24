require 'spec_helper'

describe "authenticated user creating a new article" do

  before do
    user = create(:user)
    login_as user, scope: :user # login_as is Warden method for Capy - see spec_helper
  end

  after do
    Warden.test_reset!
  end

  context "with content" do
    specify "should result in the content displayed at '/articles" do
      visit '/'
      expect :success
    end
  end

end # of describe
