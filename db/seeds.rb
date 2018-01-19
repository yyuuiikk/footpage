# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach(Rails.root.to_s + '/db/csv/site_info.csv') do |row|
	Article.create(date: row[0], thumnail: row[1], title: row[2], link: row[3], site_name: row[4], site_top: row[5], category: row[6])
end
