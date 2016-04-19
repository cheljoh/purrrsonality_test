class CatPictureService

  def initialize
    @connection = Faraday.new
  end

  def picture
    response = @connection.get("http://thecatapi.com/api/images/get?size=med&type=gif")
    response.headers["location"]
  end

  private

  def parse(path)
    JSON.parse(path)
  end
end
