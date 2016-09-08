# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

resources = Resource.create([
	{url:"yahoo.com"}
])

webcontents = Webcontent.create([
	{
		"url_id":1,
		"tag_type":"h1",
		"content":"Foo_h1"
	},
	{
		"url_id":1,
		"tag_type":"h2",
		"content":"Foo_h2"
	},
	{
		"url_id":1,
		"tag_type":"h3",
		"content":"Foo_h3"
	},
	{
		"url_id":1,
		"tag_type":"a",
		"content":"Foo_a"
	}
])