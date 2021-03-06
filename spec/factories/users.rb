Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.sequence :username do |n|
  "username#{n}"
end

Factory.define :user do |user|
  user.username { Factory.next :username }
  user.email { Factory.next :email }
#  user.password { "password" }
#  user.password_confirmation { "password" }
end
