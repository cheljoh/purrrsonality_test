require "rails_helper"

RSpec.feature "UserLogsInAndOut", type: :feature do

  before(:each) do
    Capybara.app = PurrrsonalityTest::Application
    stub_omniauth
  end

  scenario "user logs in and out" do
    VCR.use_cassette("cat_picture_service.picture") do
      visit "/"
      click_on "Sign in with Facebook"
      expect(page).to have_content("chelsea")
      expect(page).to have_link("Logout")
      expect(page).to_not have_link("Sign in with Facebook")
      click_on "Logout"
      expect(page).to have_link("Sign in with Facebook")
      expect(page).to_not have_link("Logout")
    end
  end

  def stub_omniauth
   OmniAuth.config.test_mode = true
   OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
     provider: 'facebook',
     uid: "1234",
     info: {
       name: "chelsea"
       },
     credentials: {
       token: "hello",
       secret: "secrethello",
       expires_at: Time.now
     }
   })
  end
end
