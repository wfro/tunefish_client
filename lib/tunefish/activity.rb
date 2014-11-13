class Activity
  attr_reader :id, :url, :provider
  
  def initialize(data)
    @id = data["id"]
    @url = data["url"]
    @provider = data["provider"]
  end
end