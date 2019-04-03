require './lib/line'
require './lib/station'
require './lib/data'

station_data.each do |line, stations|
  l = Line.new(line)
  stations.each do |stations|
    s = Station.new(stations)
    l.add_station(s)