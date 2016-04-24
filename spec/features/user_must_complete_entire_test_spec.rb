require "rails_helper"

RSpec.feature "UserMustCompleteEntireTest", type: :feature do
  scenario "user only fills out 10 buttons", js: true do
    visit "/"
    click_on "Take the Test!"

    wait_for_ajax

    10.times do |index|
      question_id = ("#{index + 1}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Submit!"

    wait_for_ajax

    expect(page).to have_content("Please complete all questions!")

    50.times do |index|
      question_id = ("#{index + 1}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Submit!"

    wait_for_ajax

    expect(page).to have_content("Your Internet Cat Match is")
    expect(page).to_not have_content("Please complete all questions!")
  end
end