# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

name = "Project "
entry = "Entry "

25.times do |t|
  project = Project.create(name: "#{name} ##{t}", description: "This is the description of the Project ##{t}")

  3.times do |m|
    project.entries.create(hours: 0, minutes: 30, comment: "Comment ##{m} in the proejct #{t}")
  end
end
