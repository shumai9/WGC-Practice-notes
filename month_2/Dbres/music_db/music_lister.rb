require 'active_record'
require './models'

class MyMusicDb
  attr_accessor 
  def inistialize
    @album = album
    @artist = artist
    @track = track
    @genre = genre
    @label = label
  end 
  def to_s(n)
    n.each do |n| 
      n.map do|k, v| puts "\r\t#{k}: #{v}" 
      end
    end
  end


  def create (*al)
    @album = Album.new do |al|
      {:id => "#{al}", :title => "#{al}", :isrc_code => "#{al}"}
    end
    @artist = Artist.new do |ar| 
      {:name => "#{ar}", :country =>"#{ar}"}
    end

    @track = Track.new do|tr|
      {:title => "#{tr}"}
    end
    @genre = Genre.new do |gn|
      {:name => "#{gn}"}
    end

    @label = Label.new do |la|
      {:name => "#{la}"}
    end
  end 

  def read
    @album.all.to_s
    @artist.all
    @track.all
    @genre.all
    @label.all
  end

  def update
    @album = album
    @artist = artist
    @track = track
    @genre = genre
    @label = label
  end


  def delete
    @album = album
    @artist = artist
    @track = track
    @genre = genre
    @label = label
  end
end

=begin
  
rescue Exception => e
  
end

# add / edit / delete
view = MyMusicDb.new
puts """ Please select from the options
        \r\t A, Add
        \r\t B, Delete
        \r\t C, Edit
        \r\t D, Display """

choice = gets.strip.chomp.upcase

case choice 
when 'A'||'Add'
 
  puts """Please select from option to add* below
        \r\t =>Album
        \r\t =>Artist
        \r\t =>Track """
  option = gets.strip.chomp.capitalize

  if option == "Album"
    puts """Great! now fill in below 
        \r\t =>id:
        \r\t =>title:
        \r\t =>release_date:
        \r\t =>isrc_code:
        \r\t =>label_id: """
    data = gets.strip.chomp.upcase
  elsif option == "Artist"
     puts """Fill this up please
        \r\t =>id:
        \r\t =>name:"""
  elsif option == "Track"
    puts""" please fill up
        \r\t=>id:
        \r\t=>name:"""
  else
    puts "Come back when you are ready"
  end
when 'B'||'Delete'
  puts """Please select from options to delete below
        \r\t =>Album
        \r\t =>Artist
        \r\t =>Track """
  option = gets.strip.chomp.capitalize

  if option == "Album"
    puts """select. and write key to delete
        \r\t =>id:
        \r\t =>title:
        \r\t =>release_date:
        \r\t =>isrc_code:
        \r\t =>label_id: """
    data = gets.strip.chomp.upcase
  elsif option == "Artist"
      puts """please select and write
       \r\t =>id: 
       \r\t =>name:"""
  elsif option == "Track"
    puts"""please fill up
      \r\t =>id: 
      \r\t =>name:"""
  else
    puts "Come back when you are ready"
  end
when 'C'||'Edit'
  puts """Please select from options to edit below
      \r\t =>Album
      \r\t =>Artist
      \r\t =>Track """
  option = gets.strip.chomp.capitalize

  if option == "Album"
    puts """select and write key to edit
        \r\t =>id:
        \r\t =>title:
        \r\t =>release_date:
        \r\t =>isrc_code:
        \r\t =>label_id: """
    data = gets.strip.chomp.upcase
  elsif option == "Artist"
      puts """please select and write to edit
        \r\t =>id: 
        \r\t =>name: """
      data = gets.strip.chomp.upcase
  elsif option == "Track"
    puts""" please fill up to edit
        \r\t =>id:
        \r\t =>name:"""
    data = gets.strip.chomp.upcase
  else
    puts "Come back when you are ready"
  end
when 'D'||'Display'
puts """Please select from options to Display below
    \r\t =>Album
    \r\t =>Artist
    \r\t =>Track """
option = gets.strip.chomp.capitalize

if option == "Album"
  puts "selected #{option} for display 
    \r\t#{ view.all.to_s}"
elsif option == "Artist"
    puts "You have select #{option} to display
    \r\t#{@artist.all.to_s}"
     
elsif option == "Track"
  puts"You have select #{option} to display
    \r\t#{@track.all.to_s}"
else
  puts "sorry try again"
end
end


=end