class Station

  attr_reader :name, :lines

  def initialize (name)
    @name = name
    @line = []
  end

  def add_line(line)
    @lines << line
  end

  def route_to(station)
    @line.first.route(self, station)
  end
end


