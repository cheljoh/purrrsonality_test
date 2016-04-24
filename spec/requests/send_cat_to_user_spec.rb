require "rails_helper"

RSpec.describe "SendCattoUser", type: :request do
  include SpecHelpers

  scenario "user takes test and cat match is sent to users controller" do
    make_cats
    user = User.create(name: "Sammy")

    cat = Cat.first

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    post "/results", {cat: "Grumpy Cat"}

    expect(user.cat).to eq(cat)
  end
end
