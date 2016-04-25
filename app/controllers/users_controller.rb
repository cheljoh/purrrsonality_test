class UsersController < ApplicationController
  def index
    @cat = current_user.cat
  end

  def update
    @cat = Cat.find_by(name: params["cat"])
    current_user.update(cat_id: @cat.id)
    redirect_to root_path
  end


end
