class UsersController < ApplicationController
  def update
    require "pry"; binding.pry
    user = User.find(current_user.id).update(cat: params["cat"])
    redirect_to root_path
  end
end
