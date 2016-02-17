# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tournaments = [{name: 'ABC'}, {name: 'DEF'}, {name: 'GHI'}]
players = Player.create([{name: 'bob'}, {name: 'alex'}, {name: 'josh'}])

tournaments.each do |tournament|
  setup = Tournament.create(tournament)
  players.each do |player|
    setup.players.push(player)
  end
end