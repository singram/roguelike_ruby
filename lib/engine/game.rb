require 'matrix'

require './actor'
require './action'
require './action_result'
require './actions/walk'
require './actor_input_handler'
require './direction'
require './dungeon'
require './hero'

class Game

  attr_accessor :actors

  def initialize(hero = Hero.new)
    @hero = hero
    @dungeon = Dungeon.new
    @dungeon.add_actor(@hero)
    @actor_iterator = @dungeon.actors.cycle
    @input_handler = ActorInputHandler.new(self)
  end

  def input_focus
    @hero
  end

  def process(actor)
    action = actor.next_action
    return unless action
    while true do
      result = action.perform(actor)
      return if result.failure?
      break unless result.alternative_action
      action = alternative_action
    end
  end

  def start
    @dungeon.actors.cycle do |actor|
      break unless @hero.alive?
      @input_handler.handle_input
      process(actor)
    end
  end

end
