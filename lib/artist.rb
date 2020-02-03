require "pry"

class Artist

    attr_accessor :name, :song

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.find_all { |song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if all.find {|artist| artist.name == name}
            all.find {|artist| artist.name == name}
        else
            Artist.new(name)
        end
    end

    def print_songs
        Song.all.each do |song| 
            if song.artist == self
                puts song.name
            end
        end
    end

end