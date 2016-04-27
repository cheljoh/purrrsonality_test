require "rails_helper"

RSpec.feature "UserViewsAboutPage", type: :feature do

  scenario "user views about page" do
    visit "/"
    click_on "About"

    expect(page).to  have_content("About the Purrrsonality Test!")
  end


end
