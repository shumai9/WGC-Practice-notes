class Line
  attr_reader :name, :stations

  def initialize (name)
    @name = name  
    @stations = []
  end
  
  def add_station(station)
    @stations << station
    @station.add_line(self)
  end

  def route (start_station, end_station)
    start_index = @stations.index(start_station)
    end_index = @stations.index(end_station)
    out_put = []
    
    for index in start_index..end_index do    
      out_put << @stations[index]
    end
    out_put
  end

end




