require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_array = filename.split(/\s-\s/)
        new_song = Song.new(song_array[1])
        new_artist = Artist.new(song_array[0])
        new_song.artist = new_artist
        new_artist.add_song(new_song)
        new_song
    end

    def artist_name=(artist_name)
        artist_object = Artist.find_or_create_by_name(artist_name)
        self.artist = artist_object
    end


end