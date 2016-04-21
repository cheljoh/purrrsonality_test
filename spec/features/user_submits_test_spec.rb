require "rails_helper"

RSpec.feature "UserSubmitsTestSpec", type: :feature do

  scenario "user submits test", js: true do #solved by moving html out of ajax request? when js true is on cant find
    pending
    visit "/"
    # click_on "Take the Test!"
    # sleep 10
    choose("1")
    # find(:radio_button, '1', checked: false)

  end

end

#input[group][value]

#capybara execute script, pass jquery do check buttons

#update firefox


# As a user
# After I have completed all my test questions
# I press 'submit'
# And see my results on the same page
