require "rails_helper"

RSpec.feature "UserSharesResultsonFacebook", type: :feature do

  #need to change open graph markup-make it dynamic

  scenario "user completes test, views results, and shares on facebook", js: true do
    pending
    visit "/"
    click_on "Take the Test!"

    wait_for_ajax

    50.times do |index|
      question_id = ("#{index + 1}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Submit!"

    wait_for_ajax

    click_link ".fb-share-button"
  end
end
