class UsersController < ApplicationController
  def index
    if current_user
      @cat = current_user.cat
    else
      @cat = Cat.find_by(name: "Colonel Meow")
    end
  end

  def update
    @cat = Cat.find_by(name: params["cat"])
    current_user.update(cat_id: @cat.id)
    redirect_to root_path
  end


end
