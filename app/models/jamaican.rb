class Jamaican

  attr_accessor :id, :name, :position, :shirts

  def initialize(input)
    @id = input["id"]
    @name = input["name"]
    @position = input["bobsled_position"]
    @shirts = input["shirts"]
  end

  def self.find(id)
    unirest_jamaican = Unirest.get("#{ENV['API_URL']}/jamaicans/#{id}.json").body
    jamaican = Jamaican.new(unirest_jamaican)
    return jamaican
  end

  def self.all
    unirest_jamaicans = Unirest.get("#{ENV['API_URL']}/jamaicans").body
    jamaicans = []
    unirest_jamaicans.each do |unirest_jamaican|
      jamaican = Jamaican.new(unirest_jamaican)
      jamaicans << jamaican
    end
    return jamaicans
  end

  def destroy
    jamaican = Unirest.delete("#{ENV['API_URL']}/jamaicans/#{id}")
  end

end

