class MusicImporter
    attr_accessor :path

    @@library = []

    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |file| file.gsub("#{path}/", "") }
    end

    def import
        files.each {|filename| Song.create_from_filename(filename)}
    end
end