require 'pry'
class MP3Importer
    attr_accessor :path, :files

    def initialize(file_path)
        @path = file_path
    end

    def files
        Dir["#{path}/*.mp3"].map do |filename|
            # binding.pry
            filename.slice!("#{path}/")
            filename
        end
    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end

end