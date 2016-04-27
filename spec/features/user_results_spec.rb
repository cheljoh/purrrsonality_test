require "rails_helper"

RSpec.feature "UserCompletesTestAndSeesSavedResults", type: :feature do
  include SpecHelpers
  scenario "user submits test and scores Shironeko", js: true do
    make_cats
    user = User.create(name: "hello")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Take the Test!"

    wait_for_ajax

    10.times do |index|
      question_id = ("#{index + 1}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 11}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 21}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 31}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 41}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Submit!"

    wait_for_ajax

    expect(page).to have_content("Shironeko")

    click_on user.name

    expect(page).to have_content("Shironeko")
  end

  scenario "user views results page before taking test" do
    make_cats
    user = User.create(name: "Helga")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"

    click_on "Helga"

    expect(page).to have_content("Are you a Grumpy Cat? Take the test to find out!")
  end
end
