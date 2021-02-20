class Artist
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        save
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        all.clear
    end

    def self.create(name)
        artist = new(name)
        artist.save
        artist
    end

    def songs
        Song.all.select {|song| song.artist == self}
        @songs
    end

    def add_song(song)
       song.artist = self unless song.artist
       @songs << song unless @songs.include?(song)
    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end

end