class ColonelController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Colonel Meow") 
  end
end
