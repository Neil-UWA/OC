require 'faker'

FactoryGirl.define do 
	factory :comment do |f|
		f.comment {Faker::Lorem.sentence}
	end 
end 
