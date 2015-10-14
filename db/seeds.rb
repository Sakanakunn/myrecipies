# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
chef = Chef.create(chefname: "bob safa bob" , email:"asdfadfadfs@yahoo.com")
chef.recipes.create(name:"ramen soup",summary:"very spicy soup with pork born and chicken!" ,description:"if you wanna eat it,you should come back to japan in a few years!")