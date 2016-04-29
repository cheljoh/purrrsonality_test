class ShironekoController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Shironeko")
    prepare_meta_tags(title: "I got #{@cat.name}, what will you get?!",
                      description: @cat.description,
                      image: @cat.picture)
  end
end
