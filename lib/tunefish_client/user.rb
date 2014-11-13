class User
  attr_reader :name, :id, :photo, :activity_ids

  def initialize(data)
    @name  = data["name"]
    @id    = data["id"]
    @photo = data["photo"]
    @activity_ids = data["activity_ids"]
  end
end