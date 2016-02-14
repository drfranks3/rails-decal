class Foobar

  def initialize(bar)
    @foo = bar
  end

  def bar(foo, bar)
    return "#{foo}#{@foo}#{bar[:sat]}"
  end
  
end
