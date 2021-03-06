require "rails_helper"

RSpec.feature "UserGeneratesRandomCatSpec", type: :feature do
  include SpecHelpers

  scenario "user sees a random cat gif", js: true do
    make_cats
    visit "/"
    expect(page).to have_css("a", count: 3)
    click_on "Generate Random Cat Gif!"
    wait_for_ajax
    expect(page).to have_css("a", count: 4)
  end
end
