require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    data = file.split(/[-.]/)
    artist = data[0].strip
    name = data[1].strip
    song = self.new_by_name(name)
    song.artist_name=artist
    song
  end


  def self.create_from_filename(file)
    data = file.split(/[-.]/)
    artist = data[0].strip
    name = data[1].strip
    song = self.create_by_name(name)
    song.artist_name=artist
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
