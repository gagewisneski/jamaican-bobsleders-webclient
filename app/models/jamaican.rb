class Jamaican

  attr_accessor :id, :name, :position, :shirts

  def initialize(input)
    @id = input["id"]
    @name = input["name"]
    @position = input["bobsled_position"]
    @shirts = input["shirts"]
  end

end

