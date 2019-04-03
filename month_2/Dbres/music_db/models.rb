require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'music.db'
  )

ActiveRecord::Base.logger = Logger.new(STDOUT)



class Album < ActiveRecord::Base
  validates :id, :title, :release_date, presence: true
  belongs_to :label
  has_many :albums_tracks
  has_many :tracks, through: :albums_tracks
end

class Label < ActiveRecord::Base
  validates :id, :name, presence: true
  has_many :albums
end

class Genre < ActiveRecord::Base
  validates :id, :name, presence: true
  has_many :tracks
end

class Artist < ActiveRecord::Base
  validates :id, :name, :country, presence: true
  has_and_belongs_to_many :tracks
  has_many :artists, through: :artists_tracks
end

class Track < ActiveRecord::Base
  validates :id, :title, presence: true
  has_and_belongs_to_many :artists
  belongs_to :genre
end

class AlbumTrack < ActiveRecord::Base
end

class ArtistTrack < ActiveRecord::Base
end

#class AlbumArtist < ApplicationRecord::Base
#end
