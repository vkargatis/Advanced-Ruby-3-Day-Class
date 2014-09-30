class Monster
  attr_accessor :vulnerabilities, :dangers, :name
  attr_reader :nocturnal, :legs

  @@monster_count = 0

  def self.inherited klass
    puts "#{klass} is a new type of Monster - oh noes!"
  end

  def self.types
    # return a list of all types on Monsters
  end

  def self.count
    @@monster_count
  end

  def initialize noc, legs, name="Monster", vul = [], dangers = []
    @name            = name
    @nocturnal       = noc
    @vlunerabilities = vul
    @dangers         = dangers
    @legs            = legs

    @@monster_count += 1
  end

public

  def attack human
    puts "#{name} #{dangers.sample} #{human.name}!!"
  end

  def say_name
    "My name is #{@name}"
  end

  def shout_name
    @name.upcase
  end

protected

  def whisper_creepily
    puts "boooo....."
  end

private

  def set_nocturnal_to_false
    @nocturnal = false
  end

end
