class HomeController < ApplicationController

  def index
    #@cat = Cat.find_by(name: params["cat"]) if params.has_key?("cat")

    if params.has_key?("cat")
      @cat = Cat.find_by(name: params["cat"])
    else
      @cat = Cat.find_by(name: "Colonel Meow")
    end
    # @default_cat = params.has_key?("cat")
  end
end
