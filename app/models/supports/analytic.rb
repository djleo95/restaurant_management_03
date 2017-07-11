class Supports::Analytic
  attr_reader :analytics

  def initialize arg
    @argument = arg
  end

  def load_data
    @argument
  end
end
