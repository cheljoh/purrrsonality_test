require "rails_helper"

RSpec.feature "StaticCatRoutes", type: :feature do
  include SpecHelpers

  scenario "Shironeko" do
    make_cats

    visit "/Shironeko"

    expect(page).to have_content("You are super chill and don't mind having things placed on your head")
    expect(page).to have_content("Shironeko")
  end

  scenario "Colonel Meow" do
    make_cats

    visit "/Colonel%20Meow"

    expect(page).to have_content("You are organized and get shit done. And look really cool while doing it.")
    expect(page).to have_content("Colonel Meow")
  end

  scenario "Newspaper Kitteh" do
    make_cats

    visit "/Newspaper%20Kitteh"

    expect(page).to have_content("You are inquisitive and embody a curious cat. Just don't get killed!")
    expect(page).to have_content("Newspaper Kitteh")
  end

  scenario "Lil Bub" do
    make_cats

    visit "/Lil%20Bub"

    expect(page).to have_content("You are trusting and love to lap milk")
    expect(page).to have_content("Lil Bub")
  end

  scenario "Keyboard Cat" do
    make_cats

    visit "/Keyboard%20Cat"

    expect(page).to have_content("You also enjoy playing the keyboard and wearing blue shirts.")
    expect(page).to have_content("Keyboard Cat")
  end

  scenario "Grumpy Cat" do
    make_cats

    visit "/Grumpy%20Cat"

    expect(page).to have_content("You hate...most things")
    expect(page).to have_content("Grumpy Cat")
  end
end
