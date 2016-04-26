class UsersController < ApplicationController
  def index
    if current_user.cat
      @cat = current_user.cat
    else
      @cat = Cat.find_by(name: "Grumpy Cat")
    end
    prepare_meta_tags(title: @cat.name,
                      description: @cat.description,
                      image: @cat.picture)
  end

  def update
    @cat = Cat.find_by(name: params["cat"])
    current_user.update(cat_id: @cat.id)
    redirect_to root_path
  end


end
