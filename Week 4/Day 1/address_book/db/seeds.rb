# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Contact.create name: 'Bob', address: '123 avenue', phone_number: '1234', email_address: 'bob@gmail.com', avatar_file_name: 'monkey1.png'
Contact.create name: 'John', address: '456 avenue', phone_number: '4321', email_address: 'john@gmail.com', avatar_file_name: 'monkey2.jpeg'
Contact.create name: 'Mark', address: '789 avenue', phone_number: '5678', email_address: 'mark@gmail.com', avatar_file_name: 'monkey3.png'
Contact.create name: 'Steven', address: '012 avenue', phone_number: '8765', email_address: 'steven@gmail.com', avatar_file_name: 'monkey4.jpeg'
Contact.create name: 'Carl', address: '098 avenue', phone_number: '9012', email_address: 'carl@gmail.com', avatar_file_name: 'monkey5.jpeg'
Contact.create name: 'George', address: '765 avenue', phone_number: '2109', email_address: 'george@gmail.com', avatar_file_name: 'monkey6.png'
Contact.create name: 'Harry', address: '432 avenue', phone_number: '1845', email_address: 'harry@gmail.com', avatar_file_name: 'monkey7.png'