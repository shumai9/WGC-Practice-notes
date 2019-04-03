label_list = [%w(Sony),%w(Abby-Records),%w(Broken-Records),%w(Hell.etc)]
genre_list = [%w(Punk),%w(Pop),%w(Metal),%w(Screemo),%w(Classical),%w(Easy Listerning),%w(Rock)]
artists_list = [[%w(Britney), %w(USA)],[%w(Spice Girl),%w(UK)],[%w(Tatu),%w(Russia)],[%w(Baby Metal),%w(Japan)][%w(Wallabies),%w(Australia)]]
albums_list = [%w(Begginings), %w(Happy Endings),%w(I spit on your grave),%w(Your mother's got a penis),%w(New shiz),%w(Slightly More PC),%w(It just gets better),%w(Yeah, done),%w(Boaty McBoatface)]
track_list = [[%w(),%w()],[%w(),%w()],[%w(),%w()],[%w(),%w()],[%w(),%w()],[%w(),%w()],[%w(),%w()]]


label_list.each do |label|
  Label.create(:id rand(10), :name = label)
end

genre_list.each do |genre|
 seq = (1..7).step(1).to_a.each {|n| n} 
   
  Genre.create( id: seq, name: genre)
end

artists_list.each do |artist, country|
  id = rand(1...10)
  Artist.create(id: id, name: artist, country: country)
end

albums_list.each do |album|??????
  date = Time.at(rand *Time.now.to_i)
  id = rand(1...10)
  num =rand(12**11)
  Album.create( id: id, name: album, release_date: date, isrc_code: num)
end

