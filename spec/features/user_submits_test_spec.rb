require "rails_helper"

RSpec.feature "UserSubmitsTestSpec", type: :feature do
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
    expect(page).to have_content("Extraversion: 34/50")
    expect(page).to have_content("Conscientiousness: 26/50")
    expect(page).to have_content("Intellect/Imagination: 22/50")
    expect(page).to have_content("Emotional Stability: 42/50")
    expect(page).to have_content("Agreeableness: 26/50")
  end

  scenario "user submits test and scores Newspaper Kitteh", js: true do
    make_cats
    user = User.create(name: "hello")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Take the Test!"

    wait_for_ajax

    10.times do |index|
      question_id = ("#{index + 1}-5")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 11}-5")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 21}-5")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 31}-5")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 41}-5")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Submit!"

    wait_for_ajax

    expect(page).to have_content("Newspaper Kitteh")
    expect(page).to have_content("Extraversion: 26/50")
    expect(page).to have_content("Conscientiousness: 34/50")
    expect(page).to have_content("Intellect/Imagination: 38/50")
    expect(page).to have_content("Emotional Stability: 18/50")
    expect(page).to have_content("Agreeableness: 34/50")
  end

  scenario "user submits test and scores Grumpy Cat", js: true do
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
      question = index + 11
      question_id = ("#{question}-1")
      if question == 12
        page.execute_script("$('#12-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question = index + 21
      question_id = ("#{question}-1")
      if question == 22
        page.execute_script("$('#22-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question = index + 31
      question_id = ("#{question}-1")
      if question == 32
        page.execute_script("$('#32-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 41}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Submit!"

    wait_for_ajax

    expect(page).to have_content("Grumpy Cat")
    expect(page).to have_content("Extraversion: 34/50")
    expect(page).to have_content("Conscientiousness: 26/50")
    expect(page).to have_content("Intellect/Imagination: 22/50")
    expect(page).to have_content("Emotional Stability: 42/50")
    expect(page).to have_content("Agreeableness: 14/50")
  end

  scenario "user submits test and scores Lil BUB", js: true do
    make_cats
    user = User.create(name: "hello")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Take the Test!"

    wait_for_ajax

    10.times do |index|
      question = index + 1
      question_id = ("#{question}-1")
      if question == 7
        page.execute_script("$('#7-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question = index + 11
      question_id = ("#{question}-1")
      if question == 11
        page.execute_script("$('#11-5').prop('checked', true).trigger('click')")
      elsif question == 17
        page.execute_script("$('#17-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question = index + 21
      question_id = ("#{question}-1")
      if question == 27
        page.execute_script("$('#27-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question = index + 31
      question_id = ("#{question}-1")
      if question == 37
        page.execute_script("$('#37-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 41}-1")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Submit!"

    wait_for_ajax

    expect(page).to have_content("Lil Bub")
    expect(page).to have_content("Extraversion: 38/50")
    expect(page).to have_content("Conscientiousness: 26/50")
    expect(page).to have_content("Intellect/Imagination: 22/50")
    expect(page).to have_content("Emotional Stability: 42/50")
    expect(page).to have_content("Agreeableness: 42/50")
  end

  scenario "user submits test and scores Colonel Meow", js: true do
    make_cats
    user = User.create(name: "hello")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Take the Test!"

    wait_for_ajax

    10.times do |index|
      question = index + 1
      question_id = ("#{question}-1")
      if question == 3
        page.execute_script("$('#3-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question = index + 11
      question_id = ("#{question}-1")
      if question == 13
        page.execute_script("$('#13-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question = index + 21
      question_id = ("#{question}-1")
      if question == 23
        page.execute_script("$('#23-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question = index + 31
      question_id = ("#{question}-1")
      if question == 33
        page.execute_script("$('#33-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question = index + 41
      question_id = ("#{question}-1")
      if question == 42
        page.execute_script("$('#42-5').prop('checked', true).trigger('click')")
      elsif question == 43
        page.execute_script("$('#43-5').prop('checked', true).trigger('click')")
      elsif question == 48
        page.execute_script("$('#48-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Submit!"

    wait_for_ajax

    expect(page).to have_content("Colonel Meow")
    expect(page).to have_content("Extraversion: 34/50")
    expect(page).to have_content("Conscientiousness: 50/50")
    expect(page).to have_content("Intellect/Imagination: 22/50")
    expect(page).to have_content("Emotional Stability: 42/50")
    expect(page).to have_content("Agreeableness: 30/50")
  end

  scenario "user submits test and scores Keyboard Cat", js: true do
    make_cats
    user = User.create(name: "hello")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Take the Test!"

    wait_for_ajax

    10.times do |index|
      question = index + 1
      question_id = ("#{question}-1")
      if question == 1
        page.execute_script("$('#1-5').prop('checked', true).trigger('click')")
      else
        page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
      end
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 11}-3")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 21}-3")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 31}-3")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Next!"

    10.times do |index|
      question_id = ("#{index + 41}-3")
      page.execute_script("$('#" + question_id + "').prop('checked', true).trigger('click')")
    end

    click_on "Submit!"

    wait_for_ajax

    expect(page).to have_content("Keyboard Cat")
    expect(page).to have_content("Extraversion: 34/50")
    expect(page).to have_content("Conscientiousness: 30/50")
    expect(page).to have_content("Intellect/Imagination: 30/50")
    expect(page).to have_content("Emotional Stability: 30/50")
    expect(page).to have_content("Agreeableness: 30/50")
  end

end
