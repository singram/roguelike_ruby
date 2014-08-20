module Actions

  class Walk < Action

    attr_accessor :direction

    def initialize(dir)
      @direction = dir
    end

    def perform(actor)
      l = actor.location + @direction
      if actor.dungeon.location_available?(l)
        actor.location = l
        ActionResult.new(ActionResult::SUCCESS)
      else
        ActionResult.new(ActionResult::FAILURE)
      end
    end

    def undo(actor)
      actor.location -= @direction
    end

    def to_s
      p @direction
    end

  end

end
