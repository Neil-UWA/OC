require 'faker'

FactoryGirl.define do 
	factory :category do
		category {Faker::Name.name}
	end 
end 
