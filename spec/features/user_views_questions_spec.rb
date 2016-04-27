require "rails_helper"

RSpec.feature "UserViewsQuestions", type: :feature do
  include SpecHelpers

  scenario "user views questions", js: true do
    make_cats
    visit "/"
    click_on "Take the Test!"
    wait_for_ajax
    expect(page).to  have_content("Am the life of the party")

    expect(page).to  have_content("Have difficulty understanding abstract ideas")
  end


end
