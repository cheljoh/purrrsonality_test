require "rails_helper"

RSpec.feature "UserViewsRootPage", type: :feature do
  include SpecHelpers

  scenario "user visits root page" do
    make_cats
    visit "/"
    expect(page).to have_content("Purrrsonality Test")
    expect(page).to have_button("Generate Random Cat Gif!")
    expect(page).to have_button("Take the Test!")
  end
end
