class Dungeon

  attr_accessor :actors

  def initialize
    @height = 10
    @width  = 10
    @actors = []
  end

  def add_actor(actor)
    actor.location = available_location
    actor.dungeon = self
    @actors << actor
  end

  def available_location
    l = Vector[0, 0]
    while location_occupied?(l)
      l = Vector[ rand(@width), rand(@height) ]
    end
    l
  end

  def location_available?(l)
    location_inside_dungeon?(l) && !location_occupied?(l)
  end

  def location_inside_dungeon?(l)
    l[0] >= 0 && l[1] >= 0 && l[0] < @width && l[1] < @height
  end

  def location_occupied?(l)
    @actors.any?{ |a| a.location == l }
  end

end
