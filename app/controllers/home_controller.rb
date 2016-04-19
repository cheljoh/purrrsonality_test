class HomeController < ApplicationController

  def index
    @picture = CatPictureService.new.picture if params["button"]
  end
end
