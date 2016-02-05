# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Concert.create artist: 'Metallica', venue: 'AT&T Park', city: 'San Francisco, USA', date: Date.new(2016, 2, 6), price: 257, description: 'Hello'
Concert.create artist: 'Muse', venue: 'Bercy Arena', city: 'Paris, France', date: Date.new(2016, 2, 26), price: 106, description: 'Hello'
Concert.create artist: 'AC/DC', venue: 'Phillips Arena', city: 'Atlanta, USA', date: Date.new(2016, 3, 8), price: 125, description: 'Hello'
Concert.create artist: 'RHCP', venue: 'New Orleans Jazz & Heritage Festival', city: 'New Orleans, USA', date: Date.new(2016, 4, 24), price: 75, description: 'Hello'
Concert.create artist: 'Elton John', venue: 'Germain Arena', city: 'Estero, USA', date: Date.new(2016, 3, 9), price: 157, description: 'Hello'
