require "rails_helper"

RSpec.feature "UserSharesResultsonFacebook", type: :feature do
  include SpecHelpers

  scenario "user completes test, views results, and shares on facebook", js: true do
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

    page.driver.browser.window_handles.length.should == 1

    click_on "Share on Facebook!"

    page.driver.browser.window_handles.length.should == 2
  end
end
