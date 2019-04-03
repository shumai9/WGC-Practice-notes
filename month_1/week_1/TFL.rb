=begin
travel_ops= {victoria_Line:%w(Kings-Cross Euston Warren-Street Oxford-Circus Green-Park Victoria Pimlico),
bakerloo_Line:%w(Elephant-and-Castle Lambeth-North Waterloo Embankment Charing-Cross Picadilly-Circus Oxford-Circus Regents-Park Baker-Street),
central_Line:%w(Notting-Hill-Gate Queensway Lancaster-Gate Marble-Arch Bond-Street Oxford-Circus Tottenham-Court-Road Holborn Chancery-Lane)}

puts "what line?"
  ans = gets.strip.chomps.downcase
puts_ops

victoria_Line.each { | s | puts s}


=end



require'pry'

#master_lines = {victoria :victoria_line, bakerloo :bakerloo_line, central :central_line}

victoria_line = ["Kings Cross", "Euston", "Warren Street", "Oxford Circus", "Green Park", "Victoria", "Pimlico"]

bakerloo_line = ["Elephant and Castle", "Lambeth North", "Waterloo", "Embankment", "Charing Cross", "Picadilly Circus", "Oxford Circus", "Regents Park", "Baker Street"]

central_line = ["Notting Hill Gate", "Queensway", "Lancaster Gate", "Marble Arch", "Bond Street", "Oxford Circus", "Tottenham Court Road", "Holborn", "Chancery Lane"]

puts "Hello welcome to station master.  Please select your starting line from these options: Victoria, Bakerloo and Central."

starting_line = gets.strip.chomp.downcase

puts "Your starting tube line is the #{starting_line} line."

  if    starting_line == "victoria"
        starting_line = victoria_line
          puts "Stations on this line are #{victoria_line.join(", ")}."
  elsif starting_line == "bakerloo"
        starting_line = bakerloo_line
          puts "Stations on this line are #{bakerloo_line.join(", ")}."
  else  starting_line == "central"
        starting_line = central_line
        puts "Stations on this line are #{central_line.join(", ")}."
  end

  puts "Please select your starting station?"

  starting_station = gets.strip.chomp.capitalize
  starting_array = starting_line.index(starting_station)


  puts "Your starting tube station is #{starting_station}. \
  Please select your ending line from these options: Victoria, Bakerloo and Central."

  ending_line = gets.strip.chomp.downcase

  puts "Your ending tube line is the #{ending_line} line."

  if  ending_line == "victoria"
      ending_line = victoria_line
        puts "Stations on this line are #{victoria_line.join(", ")}."
  elsif ending_line == "bakerloo"
        ending_line = bakerloo_line
          puts "Stations on this line are #{bakerloo_line.join(", ")}."
  else  ending_line == "central"
        ending_line = central_line
        puts "Stations on this line are #{central_line.join(", ")}."
  end

  puts "Please select your final station?"

  final_station = gets.strip.chomp.capitalize
  ending_array = ending_line.index(final_station)

  if starting_line != ending_line
    first_leg_stops = (starting_line.index("Oxford Circus") - starting_array).abs
    second_leg_stops = (ending_array  - ending_line.index("Oxford Circus")).abs
    total_stops = first_leg_stops + second_leg_stops
    binding.pry

  else

    stops = ending_array - starting_array
      if ending_array < starting_array
        stations_travelled = starting_line.reverse.slice((ending_array + 1), stops.abs)
      else
          stations_travelled = starting_line.slice((starting_array - 1), stops.abs)
      end

      puts "Your final tube station is #{final_station}.  You will be travelling for\
    #{stops.abs} stops calling at the following stations: #{stations_travelled.join(", ")}."

  end
