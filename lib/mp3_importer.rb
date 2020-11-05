# The MP3Importer class will parse all the filenames in the spec/fixtures folder and send the filenames to the Song class

class MP3Importer

    attr_accessor :path

    def initialize(files)
        @path = "./spec/fixtures/mp3s"
    end

    #files gets called by #import and returns an array
    #files turns the files paths into a string
    #then removes the directory part of the string

    def files 
        @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    end

    # #import takes each normalized filename and sends it to the Song class #new_by_filename
    # which creates a new song instance for each of the filenames
    # #import calls #files
    # so it is calling the method on the MP3Importer instance
    # #import is collaborating with Song instances by calling a Song method (new_by_filename) 
    # which creates a new song for every item in the array
   
    def import
        self.files.each{|f| Song.new_by_filename(f)}
    end

end

# Build an MP3Importer class that parses a directory of files and sends the filenames to a song class to create a library 
# of music with artists that are unique. To do this, you'll need two methods: 
# Mp3Importer#files and MP3Importer#import. 
# Your MP3Importer class should also have a path attribute that gets set on initialization.

# You should write code that responds to MP3Importer.new('./spec/fixtures').import. 
# Google around for how to get a list of files in a directory! Make sure you only get .mp3 files.

# Since we have to send the filenames to the Song class, we'll end up calling the following code in 
# the #import method: Song.new_by_filename(some_filename). This will send us to the Song class, 
# specifically Song.new_by_filename and handle the creation of Song instances and their associated Artist instances.