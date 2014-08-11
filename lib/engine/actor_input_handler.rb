require 'curses'

class ActorInputHandler

  attr_accessor :actor

  def initialize(game)
    @actor = game.input_focus
  end

  def handle_input
    case Curses.getch
#    when Curses::Key::LEFT
    when 'a'
      @actor.next_action = Actions::Walk.new(Direction::WEST)
#    when Curses::Key::RIGHT
    when 'd'
      @actor.next_action = Actions::Walk.new(Direction::EAST)
#    when Curses::Key::UP
    when 'w'
      @actor.next_action = Actions::Walk.new(Direction::NORTH)
#    when Curses::Key::DOWN
    when 's'
      @actor.next_action = Actions::Walk.new(Direction::SOUTH)
    else
      p 'BLAGH'
    end
  end

end
