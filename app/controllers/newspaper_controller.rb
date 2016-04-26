class NewspaperController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Newspaper Kitteh")
  end
end
