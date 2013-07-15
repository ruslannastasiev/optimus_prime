FactoryGirl.define do
  factory :user do  
    sequence(:email) { |n| "ruslan#{n}@gmail.com" }
    password              "123456"
    password_confirmation "123456"
    admin                 "true"
  end

  factory :championship do |championship|
    championship.name  "ua"
    championship.user    
  end

  factory :team do |team|
   sequence(:name) {|n| "team #{n}"}
   championship 
  end

  factory :score do |score|
  end

  factory :micropost do 
    content      "this is micropost"    
  end

  factory :page do
    name           "my page"
    link           "link of page"
    content        "content of page"
  end

  factory :widget do |widget|
    name        "test widget"
    content     "content of test widget"    
  end

  factory :season do 
    sequence(:start_date) {|n| "201 #{n}"}
    description  "uachamp"    
  end
  
end