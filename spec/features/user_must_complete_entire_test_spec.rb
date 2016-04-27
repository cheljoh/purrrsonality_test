require "rails_helper"

RSpec.feature "UserMustCompleteEntireTest", type: :feature do
  include SpecHelpers

  scenario "user only fills out 9 buttons", js: true do
    make_cats
    user = User.create(name: "hello")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Take the Test!"

    wait_for_ajax

    9.times do |index|
      question_id = ("#{index + 1}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    wait_for_ajax

    expect(page).to have_content("Please complete all questions!")
  end
end
