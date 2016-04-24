class HomeController < ApplicationController

  def index
    @cat = Cat.find_by(name: params["cat"]) if params.has_key?("cat")
  end
end
