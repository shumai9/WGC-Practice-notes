require 'socket'
     # Sockets are in standard library

server = TCPServer.new(1234)
#Table.connection

class TableView
  def self.format_table_list(tables)
    output = ""
    tables.each { |t|
      output += "#{t.id}\n"
    }
    output
  end
  
  def self.format_table_bookings(tables)
    # [ [table, bookings], [table, bookings] ]
    output = ""
    tables.each do |table, bookings|
      output += "#{table.id}\n"
      bookings.each{ |b|
        output += " |- #{b.starting_time} - #{b.ending_time}\n"
      }
    end
    output
  end
end

class TableController
  def self.list_tables
    tables = Table.all
    TableView.format_table_list(tables)
  end
  
  def self.list_bookings
    tables = Table.all.map do |t|
      [t, t.bookings]
    end
    TableView.format_table_bookings(tables)
  end
  
  def self.list_bookings_soon
    tables = Table.all.map do |t|
      [t, t.bookings.where('starting_time > ? and ending_time < ?', Time.now, Time.now + 60*60*24)]
    end
    TableView.format_table_bookings(tables)
  end
end

class Router
  def self.process(url, headers)
    puts url
    puts headers
    if url =~ /list_tables/
      TableController.list_tables
    elsif url =~ /list_bookings_soon/
      TableController.list_bookings_soon
    elsif url =~ /list_bookings/
      TableController.list_bookings
    end
  end
end

class WebServer
  def self.handle(conn)
    while line = conn.gets
      if line =~ /GET ([^ ]*) HTTP\/1\.1/
        url = $1
      elsif line =~ /([^ ]*)\: (.*)/
        headers ||= {}
        headers[$1] = $2.strip
      elsif line.strip == ''
        return self.build_response(Router.process(url, headers))
      end
    end
  end
  
  def self.build_response(response_data)
    output = "HTTP/1.1 200 OK\n"
    output += "Content-Length: #{response_data.length}\n"
    output += "\n"
    output += response_data
    output
  end
end

begin
  puts "Starting socket server"
  while connection = server.accept
    puts "New connection"
    connection.puts WebServer.handle(connection)
    connection.close
    #server.close
  end
rescue Errno::ECONNRESET, Errno::EPIPE => e
  puts e.message
  retry
end    