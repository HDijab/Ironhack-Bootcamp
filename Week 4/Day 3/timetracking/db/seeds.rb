# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create name: 'Ironhack', description: 'It is a coding school'
Project.create name: 'Time tracking app'
Project.create name: 'Recipes', description: 'I want to cook'
Project.create name: 'Boats'
Project.create name: 'Football', description: 'Will I win?'
Project.create name: 'Class', description: 'Do not forget to come on time'
Project.create name: 'Sleepy', description: 'People are sleepy sometimes'
Project.create name: 'Smile', description: 'Live, laugh, love'

Entry.create hours: 4, minutes: 24, date: Date.today, comments: 'Hello', project_id: 1
Entry.create hours: 7, minutes: 45, date: Date.today, comments: 'Hello', project_id: 2
Entry.create hours: 2, minutes: 34, date: Date.today, comments: 'Hello', project_id: 3
Entry.create hours: 5, minutes: 25, date: Date.today, comments: 'Hello', project_id: 4
Entry.create hours: 7, minutes: 32, date: Date.today, comments: 'Hello', project_id: 5
Entry.create hours: 9, minutes: 24, date: Date.today, comments: 'Hello', project_id: 6
Entry.create hours: 1, minutes: 13, date: Date.today, comments: 'Hello', project_id: 7
Entry.create hours: 0, minutes: 60, date: Date.today, comments: 'Hello', project_id: 8

Entry.create hours: 3, minutes: 42, date: Date.today, comments: 'Hello', project_id: 1
Entry.create hours: 6, minutes: 54, date: Date.today, comments: 'Hello', project_id: 2
Entry.create hours: 8, minutes: 43, date: Date.today, comments: 'Hello', project_id: 3
Entry.create hours: 2, minutes: 52, date: Date.today, comments: 'Hello', project_id: 4
Entry.create hours: 4, minutes: 23, date: Date.today, comments: 'Hello', project_id: 5
Entry.create hours: 5, minutes: 42, date: Date.today, comments: 'Hello', project_id: 6
Entry.create hours: 2, minutes: 31, date: Date.today, comments: 'Hello', project_id: 7
Entry.create hours: 1, minutes: 60, date: Date.today, comments: 'Hello', project_id: 8
