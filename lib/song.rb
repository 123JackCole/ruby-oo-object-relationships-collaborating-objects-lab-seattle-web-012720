class Song

    @@all = []

    attr_accessor :name, :artist
    attr_reader :artist_name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        split_filename = filename.split(" - ")
        new_song = Song.new(split_filename[1])
        new_song.artist_name = split_filename[0]
        new_song
    end

    def artist_name= (name)
        if Artist.all.find {|artist| artist.name == name}
            @artist = Artist.all.find {|artist| artist.name == name}
        else
            @artist = Artist.new(name)
        end
    end

end