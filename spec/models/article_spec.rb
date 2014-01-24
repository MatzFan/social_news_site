require 'spec_helper'

describe Article do

  context "creation for an authenticated user" do
    specify "should link the post to the current logged in user" do
      user = create(:user)
      create(:article, user: user)
      expect(Article.first.user).to eq(user)
    end

  end

  context "creation for non-authenticagted user" do
    specify "should not be possible" do
      expect(lambda { create(:article) }).to raise_error # fails validation for user_id FK
    end
  end

end # of describe
