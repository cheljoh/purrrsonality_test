class UsersController < ApplicationController
  def index
    # if current_user.cat
      @cat = Cat.find_by(name: "Colonel Meow")
      # @cat = current_user.cat
      prepare_meta_tags(title: @cat.name,
                        description: @cat.description,
                        image: @cat.picture)
    # else
    #   @cat = Cat.find_by(name: "Grumpy Cat")
    # end
  end

  def update
    @cat = Cat.find_by(name: params["cat"])
    current_user.update(cat_id: @cat.id)
    redirect_to root_path
  end


end
