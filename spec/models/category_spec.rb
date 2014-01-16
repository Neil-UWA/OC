require 'spec_helper'

describe Category do 
	it 'is valid if it is not empty' do 
		FactoryGirl.create(:category).should be_valid
	end 

	it 'can not be empty' do 
		FactoryGirl.build(:category, category: "").should_not be_valid
	end 
end 
