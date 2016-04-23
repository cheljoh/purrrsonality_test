require "rails_helper"

RSpec.feature "UserViewsQuestions", type: :feature do

  scenario "user views questions", js: true do
    visit "/"
    click_on "Take the Test!"
    wait_for_ajax
    expect(page).to  have_content("Am the life of the party")
    expect(page).to  have_content("Am full of ideas")
  end


end
