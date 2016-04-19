require "rails_helper"

RSpec.feature "UserLogsInWithFacebook", type: :feature do

  before(:each) do
    Capybara.app = PurrrsonalityTest::Application
    stub_omniauth
  end

  scenario "logging in" do
    VCR.use_cassette("cat_picture_service.picture") do
      visit "/"
      click_on "Sign in with Facebook"
      expect(page).to have_content("cheljoh")
      expect(page).to have_link("Logout")
    end
  end

  def stub_omniauth
   OmniAuth.config.test_mode = true
   OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
     provider: 'facebook',
     extra: {
       raw_info: {
         uid: "1234",
         name: "cheljoh",
       }
     },
     credentials: {
       token: "hello",
       secret: "secrethello"
     }
   })
  end
end
