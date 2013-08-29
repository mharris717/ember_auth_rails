User.destroy_all
user1 = User.create!(:email => 'mharris717@gmail.com', :password => 'password123')
user2 = User.create!(:email => 'themozz@gmail.com', :password => 'password123')

Widget.destroy_all
Widget.create! :color => "Green", :price => 20, :user => user1
Widget.create! :color => "Blue", :price => 25, :user => user1
Widget.create! :color => "Red", :price => 30, :user => user2

# 5U3zQ3AqCGWoYGVYBrqh