require "rails_helper"

RSpec.feature "UserSubmitsTestSpec", type: :feature do

  scenario "user submits test", js: true do #solved by moving html out of ajax request? when js true is on cant find
    visit "/"
    # click_on "Take the Test!"
    # sleep 10
# save_and_open_page
    # choose("1-1")

  end

end


# As a user
# After I have completed all my test questions
# I press 'submit'
# And see my results on the same page
