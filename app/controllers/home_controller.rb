class HomeController < ApplicationController

  def index
    if params.has_key?("cat")
      @cat = Cat.find_by(name: params["cat"])
    else
      @cat = Cat.find_by(name: "Colonel Meow")
    end
  end
end
