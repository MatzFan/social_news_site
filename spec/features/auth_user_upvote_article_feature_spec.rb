require 'spec_helper'

describe "authenticated user" do

  before do
    user = create(:user)
    login_as user, scope: :user
    create(:article, user: user)
  end

  after do
    Warden.test_reset!
  end

  context "upvoting an existing article" do
    specify "should result in that article's vote count increasing by 1" do
      visit '/articles'
      click_button 'Upvote'
      expect(current_path).to eq('/articles')
      expect(page).to have_css('.vote-count', text: 1)
    end
  end

end # of describe
