class LilbubController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Lil Bub")
  end
end
