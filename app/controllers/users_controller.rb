class UsersController < ApplicationController
  def index
    if current_user
      @cat = current_user.cat if current_user.cat
    end
  end

  def update
    if current_user
      @cat = Cat.find_by(name: params["cat"])
      current_user.update(cat_id: @cat.id)
      redirect_to root_path
    end
  end

end
