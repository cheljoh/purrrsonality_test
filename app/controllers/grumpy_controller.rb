class GrumpyController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Grumpy Cat")
  end
end
