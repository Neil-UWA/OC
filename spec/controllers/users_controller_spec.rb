require 'spec_helper'

describe UsersController do 
	context 'get #Index' do 
		it 'should assign all users to @user' do 
			user = FactoryGirl.create(:user)
			get :index 
			assigns(:user).should == [user]
		end 
	end 
end 
