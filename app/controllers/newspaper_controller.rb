class NewspaperController < ApplicationController
  def show
    @cat = Cat.find_by(name: "Newspaper Kitteh")
    prepare_meta_tags(title: @cat.name,
                      description: @cat.description,
                      image: @cat.picture)
  end
end
