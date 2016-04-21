require "rails_helper"

RSpec.feature "UserGeneratesRandomCatSpec", type: :feature do

  scenario "user sees a random cat gif", js: true do
    visit "/"
    expect(page).to have_css("a", count: 2)
    click_on "Generate Random Cat Gif!"
    wait_for_ajax
    expect(page).to have_css("a", count: 3)
  end
end
