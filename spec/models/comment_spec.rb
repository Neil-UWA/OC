require 'spec_helper'

describe Comment do 
	it 'is invalid without a commment body' do
		FactoryGirl.build(:comment, comment: nil).should_not be_valid
	end 
end 
