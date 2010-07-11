# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.username "MyString"
  f.email "MyString"
  f.points 1
end
