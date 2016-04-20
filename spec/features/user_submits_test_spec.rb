require "rails_helper"

RSpec.feature "UserSubmitsTestSpec", type: :feature do

  scenario "user submits test", js: true do
    visit "/"
    click_on "Take the Test!"
    sleep 5
    #choose("responses[group][1-1]")
  end

end


# As a user
# After I have completed all my test questions
# I press 'submit'
# And see my results on the same page
