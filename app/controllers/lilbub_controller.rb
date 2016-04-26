class LilbubController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Lil Bub")
    prepare_meta_tags(title: @cat.name,
                      description: @cat.description,
                      image: @cat.picture)
  end
end
