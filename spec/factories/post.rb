require 'faker'

FactoryGirl.define do 
	factory :post do |f|
		f.title {Faker::Name.title}
		f.content {Faker::Lorem.paragraphs}
	end 
end 
