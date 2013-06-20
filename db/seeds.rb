# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


Rake::Task['db:reset'].invoke
admin = User.create!(:email => "example@railstutorial.org",
                     :password => "foobar",
                     :password_confirmation => "foobar")
admin.toggle!(:admin)
2.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password  = "password"
  User.create!(:email => email,
                   :password => password,
                   :password_confirmation => password)
end

User.all(:limit => 6).each do |user|
  2.times do
    user.microposts.create!(:content => Faker::Lorem.sentence(5))
  end
end