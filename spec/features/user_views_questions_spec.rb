require "rails_helper"

RSpec.feature "UserViewsQuestions", type: :feature do

  scenario "user views questions", js: true do
    visit "/"
    click_on "Take the Test!"
  end


end
