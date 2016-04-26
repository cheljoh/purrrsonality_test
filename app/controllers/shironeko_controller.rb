class ShironekoController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Shironeko")
  end
end
