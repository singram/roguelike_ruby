class ActionResult

  SUCCESS = true
  FAILURE = false

  def initialize(result)
    @result = result
  end

  def success?
    @result == SUCCESS
  end

  def failure?
    @result == FAILURE
  end

  def alternative_action
    return nil unless @result.is_a?(Action)
    @result
  end

end
