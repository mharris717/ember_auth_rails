require 'spec_helper'

describe SessionsController do
  include_context "users"

  describe "auth token" do
    before { controller.current_user.should be_nil }

    it 'login' do
      get :create, :auth_token => user.authentication_token
      controller.current_user.should == user
    end

    it 'failed login with token' do
      get :create, :auth_token => rand(10000000000000).to_s
      controller.current_user.should be_nil
    end

    describe "Logged in" do
      before do
        get :create, :auth_token => user.authentication_token
        controller.current_user.should == user
      end

      it 'logout' do
        delete :destroy#, :user => {:email => user.email}
        controller.current_user.should be_nil
      end
    end
  end

  describe "password" do
    before { controller.current_user.should be_nil }

    it 'login fail' do
      post :create, :email => user.email, :password => fake_password+"xyz" 
      controller.current_user.should_not be
    end

    it 'login' do
      post :create, :email => user.email, :password => fake_password
      controller.current_user.should == user
    end
  end
end