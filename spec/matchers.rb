module Matchers

  class Contain

    def initialize(part)
      @part = part
    end
    
    def matches?(whole)
      @whole = whole
      @part & @whole == @part
    end

    def failure_message
      "#{@whole} does not contain #{@part}"
    end

    def negative_failure_message
      "#{@whole} should not contain #{@part}"
    end

  end

  def contain(part)
    Contain.new part
  end
  
end