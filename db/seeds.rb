# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Beer.create([
              { name: "Kentucky Brunch Brand Stout", brewery: "Toppling Goliath Brewing Company", abv: 12, user_id: 1,
                review: "This beer is the real McCoy. Barrel aged and crammed with flavor."},
              { name: "Marshmallow Handjee", brewery: "3 Floyds Brewing Co. ", abv: 15, user_id: 1,
                review: "Dark Lord Russian Imperial Stout aged in a variety..."},
              { name: "King Julius", brewery: "Tree House Brewing Co.", abv: 8, user_id: 2, review: "King Julius is an American Double IPA brewed to be an exceptionally
                flavorful, juicy, and hop saturated beer while never tiring the palate. It’s vivid citrus aromas give way to flavors of orange creamsicle, 
                mango smoothie, and a bounty of fresh tropical fruit."},
              { name: "Assassin", brewery: "Toppling Goliath Brewing Company", abv: 12, user_id: 2, review: "I’m tasting Carmel, bourbon, black licorice, vanilla. Lucky
                enough to drink the whole bottle myself. Barely any carbonation at this point. Extremely delicious! Yum yum"},
              { name: "Fuzzy", brewery: "Side Project Brewing", abv: 8, user_id: 1, review: "Blonde American Wild Ale that was fermented and aged in Chardonnay barrels
                  with Missouri grown White Peaches."}
])

Comment.create([
                 {content: "This is great, thank you for listing this.", user_id:2, beer_id:1},
                 {content: "Everything feels nice.", user_id:1, beer_id:3},
                 {content: "Nice use of aquamarine in this idea dude.", user_id:2, beer_id:2},
                 {content: "Excellent :-) I love the use of shade and type!", user_id:2, beer_id:4},
                 {content: "This is sleek work =)", user_id:1, beer_id:5},
                 {content: "I hate this one", user_id:2, beer_id:5},





])
