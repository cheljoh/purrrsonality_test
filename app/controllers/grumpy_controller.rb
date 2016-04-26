class GrumpyController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Grumpy Cat")
    prepare_meta_tags(title: @cat.name,
                      description: @cat.description,
                      image: @cat.picture)
  end
end
