class Hero < Actor

  def next_action=(action)
    @next_action ||= action
  end

  def next_action?
    !@next_action.nil?
  end

  def next_action
    action = @next_action
    @next_action = nil
    action
  end

  def alive?
    true
  end

end
