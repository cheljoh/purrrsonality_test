require "rails_helper"

RSpec.feature "UserViewsRootPage", type: :feature do
  scenario "user visits root page" do
    visit "/"
    expect(page).to have_content("Purrrsonality Test")
    expect(page).to have_button("Generate Random Cat Gif!")
  end
end
