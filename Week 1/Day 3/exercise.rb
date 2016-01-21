require 'pry'
module Text
  def start
    puts "Go on"
  end
  def no_exit
    puts "No exit here!"
    sleep(1)
  end
  def dont_understand
    puts "Sorry, don't understand"
    sleep(1)
  end

  def location(position)
    puts "You are in Room #{position}"
  end

  def win_text
    puts "YOU WIN!\nBye!"
  end
end

class Controller
  include Text

  attr_accessor :player_pos
  def initialize(rooms)
    @rooms = rooms
    @player_pos = @rooms[0]
    @player = @rooms[0].player
    link_with_player
  end

  def begin
    start
    choice = nil
    until choice == :quit
      # system("clear")
      # location(@player.pos)
      # puts "Exits: #{(@rooms[@player.pos - 1].exits).upcase}"
      print '> '
      entry = get_action
      choice = do_action(entry)
    end
  end

  def get_action
    user_response = gets.chomp.downcase
  end

  def do_action(choice)
    puts @player_pos.rmnum
    puts @rooms[0].player
    puts @rooms[1].player
    puts '------------------------'
    case choice
    when '2'
      @player.move_between_rooms(@rooms[0], @rooms[1])
      puts @player_pos.rmnum
      puts @rooms[0].player
      puts @rooms[1].player
    end
    # case choice
    # when 'n'
    #   can_leave?(choice) ? move(@player.pos, choice) : no_exit
    # when 'w'
    #   can_leave?(choice) ? move(@player.pos, choice) : no_exit
    # when 's'
    #   can_leave?(choice) ? move(@player.pos, choice) : no_exit
    # when 'e'
    #   can_leave?(choice) ? move(@player.pos, choice) : no_exit
    # when 'quit'
    #   :quit
    # else
    #   dont_understand
    # end
  end

  def can_leave?(choice)
    if @rooms[@player.pos - 1].exits.include?(choice)
      true
    else
      false
    end
  end

  def move(player_pos, choice)
    case player_pos
    when 1
      @player.pos = 2
    when 2
      choice == "n" ? @player.pos = 4 : @player.pos = 3
    when 3
      @player.pos = 2
    when 4
    choice == "s" ? @player.pos = 2 : win
    end
  end

  def win
    win_text
    :quit
  end

  private

  def link_with_player
    @player.collector = self
  end
end

class Player
  attr_accessor :items, :collector
  def initialize
    @items = []
    @collector = nil
  end

  def move_between_rooms(room, room2)
    room.leave(self)
    @collector.player_pos = room2.enter(self)
  end
end

class Room
  attr_reader :player, :exits, :rmnum
  def initialize(player:, rmnum:, exits:, item:, entity:)
    @rmnum = rmnum
    @player = player
    @exits = exits
    @item = item
    @entity = entity
  end

  def enter(player)
    @player = player
    self
  end

  def leave(player)
    @player = nil
  end
end

class Entity
  def initialize(type)
    @type = type
  end
end

class Item
  def initialize(type)
    @type = type
  end
end


rooms = [
  Room.new(rmnum: 1, exits: 'n'   , player: Player.new   , item: nil             , entity: nil                ),
  Room.new(rmnum: 2, exits: 'n, w', player: nil          , item: nil             , entity: Entity.new('birds')),
  Room.new(rmnum: 3, exits: 'e'   , player: nil          , item: Item.new('food'), entity: nil                ),
  Room.new(rmnum: 4, exits: 'w, s', player: nil          , item: nil             , entity: Entity.new('beast')),
]

story = Controller.new(rooms)
story.begin