require './models'
require './music_lister'
require 'sinatra'
require 'sinatra/reloader'

#def to_s1
#  "#{a.id}- #{a.title}, #{a.release_date}"
#end
get '/', provides: :text do
  "List of Albums"
end

get '/albums', provides: :text do
  Album.all.map do |a|
    "List of Albums\r
   \r\t #{a.id}:-  #{a.title}"
   end # to get all album
end

get '/albums/:id', provides: :text do
  a = Album.find(params[:id])
  " \r\t #{a.id}:-  #{a.title}, Released: #{a.release_date}" # to get a particular album
end
 

post '/albums', provides: :text do
  a = Album.new params[:title]
 
  if  a.MyMusicDb.create
    status 201
  else
    status 500
  end
end



#put '/albums' do
 # a = Album.find(params[:id])
#end


  #delete do
  #end


