require 'spec_helper'


describe User do

	context 'create a new user' do 

		it 'has a valid factory' do
			FactoryGirl.create(:user).should be_valid
		end 

		it 'is invalid without an email' do 
			FactoryGirl.build(:user, email: nil).should_not be_valid	
		end 

		it 'is invalid without a password' do 
			FactoryGirl.build(:user, password: nil).should_not be_valid	
		end 

		it 'is invalid without password confirmation' do 
			FactoryGirl.build(:user, password_confirmation: nil).should_not be_valid	
		end 

		it 'is invalid without a name' do 
			FactoryGirl.build(:user, name: nil).should_not be_valid	
		end 

		it 'is invalid if the length of password < 6' do 
			FactoryGirl.build(:user, password: 12345, password_confirmation: 12345).should_not be_valid 
		end 

		it 'is invalid if confirmation does not match password' do 
			FactoryGirl.build(:user, password_confirmation: 12345).should_not be_valid 
		end 
	end 
end 
