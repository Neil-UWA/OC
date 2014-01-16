require 'faker'

FactoryGirl.define do 
	factory :post do 
		title {Faker::Name.title}
		content {Faker::Lorem.paragraphs}
	end 
end 
