class HomeController < ApplicationController

  def index
    @cat = Cat.first
  end
end
