require 'spec_helper'

describe "authenticated user" do

  before do
    user = create(:user)
    login_as user, scope: :user
  end

  after do
    Warden.test_reset!
  end

  context "creating a new article with content" do
    specify "should result in that content displayed at '/articles" do
      visit '/articles/new'
      fill_in :article_content, with: 'Some content'
      click_button 'Create Article'
      expect(current_path).to eq('/articles')
      expect(page).to have_content('Some content')
    end
  end

end # of describe
