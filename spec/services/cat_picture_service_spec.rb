require "rails_helper"

describe CatPictureService do
  it "returns an image url" do
    VCR.use_cassette("cat_picture_service#picture") do
      service = CatPictureService.new
      picture_url = service.picture
      expect(picture_url).to eq("http://24.media.tumblr.com/tumblr_m0z8oaKrqZ1rqh578o1_250.gif")
    end
  end
end
