require 'pry'
class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        if !@songs
            @songs = [song]
        else
            @songs << song
        end
    end

    def self.find_or_create_by_name(artist_name)
        search_artist = Artist.all.find do |artist|
            artist.name == artist_name
        end
        if search_artist
            search_artist
        else
            Artist.new(artist_name)
        end
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end

end