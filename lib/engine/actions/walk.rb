module Actions

  class Walk < Action

    attr_accessor :direction

    def initialize(dir)
      @direction = dir
    end

    def to_s
      p @direction
    end

  end

end
