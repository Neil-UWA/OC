require 'spec_helper'
require 'spec_helper'

describe Category do 
	it 'is valid if a category is empty' do 
		FactoryGirl.create(:category, category: nil).should be_valid	
	end 
end 
