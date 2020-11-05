# Because of the relationships between your classes, the Artist tests, i.e. the tests in spec/artist_spec.rb, 
# rely on some code in the Song class and vice versa. 
# So, as you proceed through solving this lab, you will go back and forth between coding in Artist and Song.

# The Song class will be responsible for creating songs given each filename and sending the artist's name (a string) to the Artist class


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
    
    def self.new_by_filename(file)  
        song_name = file.split(" - ")[1] # split files, array spot 1(name), saved as local var song_name
        @artist = file.split(" - ")[0] # split files, array spot 0(artist), saved as local var artist
        song = self.new(song_name)
        #this is calling the #artist_name=
        #it is a writer method that assigns that variable to artist
        #you are not just assigning the string to artist, because you want the artist attribute to be an artist instance instead
        song.artist_name = @artist
        song
    end
        
    #this is a setter method, a writer,
    #it sets the artist attribute of the song instance equal to an artist instance (rather than just a string)
    #it calls a Class Method in Artist, that returns an artist object
    #the find_or_create_by_name either finds an existing artist and returns it, or creates a new object and returns it

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
            #after the artist instance is returned
            #this method calls the artist instance method #add_song
            #add_song adds this current song instance to the artist's song list
        self.artist.add_song(self)
    end



end