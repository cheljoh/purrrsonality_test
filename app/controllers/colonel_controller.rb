class ColonelController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Colonel Meow")
    prepare_meta_tags(title: @cat.name,
                      description: @cat.description,
                      image: @cat.picture)
  end
end
