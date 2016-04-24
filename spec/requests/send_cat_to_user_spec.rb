require "rails_helper"

RSpec.describe "SendCattoUser", type: :request do

  scenario "user takes test and cat match is sent to users controller" do
    user = User.create(name: "Sammy")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    put "/results", {cat: "Grumpy Cat", picture: "http://cdn.grumpycats.com/wp-content/uploads/2012/09/GC-Gravatar-copy.png"}
  end
end
