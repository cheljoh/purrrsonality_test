require "rails_helper"

RSpec.feature "UserGeneratesRandomCatSpec", type: :feature do

  scenario "user sees a random cat gif" do
    VCR.use_cassette("cat_picture_service.picture") do
      visit "/"
      expect(page).to_not have_css(".cat-picture")
      click_on "Generate Random Cat Gif!"
      expect(page).to have_css(".cat-picture") #better way to do this?
    end
  end
end
