class KeyboardController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Keyboard Cat")
  end
end
