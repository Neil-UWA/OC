require 'spec_helper'

describe User do

	it { should have_many(:relationships) }
	it { should have_many(:followed_users).through(:relationships) }
	it { should have_many(:reverse_relationships)}
	it { should have_many(:followers).through(:reverse_relationships) }
	it { should have_many(:comments) }
	it { should have_many(:posts) }
	it { should have_many(:likes) }

	context 'validations' do 
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
