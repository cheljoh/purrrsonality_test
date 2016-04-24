require "simplecov"

module SpecHelpers

  def make_cats
    Cat.find_or_create_by(name: "Grumpy Cat",
               description: "You hate...most things. But sleep and food are cool.",
               picture: "http://cdn.grumpycats.com/wp-content/uploads/2012/09/GC-Gravatar-copy.png")

    Cat.find_or_create_by(name: "Lil Bub",
               description: "You are trusting and love to lap milk",
               picture: "http://videos.revision3.com/revision3/images/shows/lilbub/lilbub_200x200.jpg")

    Cat.find_or_create_by(name: "Shironeko",
               description: "You are super chill and don't mind having things placed on your head",
               picture: "https://static-s.aa-cdn.net/img/ios/866152887/9b88a78bcd843382fb5897d6dc9631c8")

    Cat.find_or_create_by(name: "Newspaper Kitteh",
               description: "You are inquisitive and embody a curious cat. Just don't get killed!",
               picture: "https://s-media-cache-ak0.pinimg.com/736x/00/d0/2b/00d02b7a02d3b666ddce96b43ef8a950.jpg")

    Cat.find_or_create_by(name: "Keyboard Cat",
               description: "You are the life of the party! You also enjoy playing the keyboard and wearing blue shirts.",
               picture: "https://33.media.tumblr.com/avatar_367d42588d28_128.png")

    Cat.find_or_create_by(name: "Colonel Meow",
               description: "You are organized and get shit done. And look really cool while doing it.",
               picture: "http://videos.revision3.com/revision3/images/shows/colonelmeow/colonelmeow_web_avatar.jpg")

  end
end

module WaitForAjax
  def wait_for_ajax
    Capybara.default_max_wait_time = 10
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end

RSpec.configure do |config|
  config.include WaitForAjax, type: :feature
  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  SimpleCov.start("rails")
end
