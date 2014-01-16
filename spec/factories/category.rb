require 'faker'

FactoryGirl.define do 
	factory :category do
		category {Faker::Lorem.words(num=1)}
	end 
end 
