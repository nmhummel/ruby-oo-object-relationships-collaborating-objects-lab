# Because of the relationships between your classes, the Artist tests, i.e. the tests in spec/artist_spec.rb, 
# rely on some code in the Song class and vice versa. 
# So, as you proceed through solving this lab, you will go back and forth between coding in Artist and Song.

# We recommend starting out by getting some of the initial Artist tests passing 
# and switching to write code in the Song class as directed by the test output.

# The Artist class will be responsible for either creating the artist (if the artist doesn't exist in our program yet) 
# or finding the instance of that artist (if the artist does exist).

class Artist

    attr_accessor :name

    @@all = []  #stores all Artist instances in this variable

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all # This class method should return all Artist instances.
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song) # This instance method exists to tell a passed in Song instance it belongs to this Artist instance.
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        if self.all.find{|i| i.name == name}
            self.all.find{|i| i.name == name}
        else
            self.new(name)
        end
    end

    def print_songs
        songs.each {|tune| puts tune.name}
    end


    

    # Artist.find_or_create_by_name
    # This class method should take the name that is passed in (remember, it will be a string), and do one of two things. 
    # Find the artist instance that has that name or create one if it doesn't exist. Either way, the return value of the method will 
    # be an instance of an artist with the name attribute filled out.

    # Artist#print_songs
    # This instance methods outputs the names of all songs associated with this Artist instance.

end