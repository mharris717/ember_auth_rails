require 'spec_helper'

describe EmberUsersController do
  let(:user) do
    res = User.new(:email => "#{rand(100000000000000)}@fun.com", :password => "dfgdfgdfgdgfghfghfgh")
    a = "dbb8c110295d4dfaa8c386377d2e05e9"
    b = "c11b0047d2394bbf91dd27f6e9f45d98"
    res.save!
    res.identities.create(:access_token => a, :access_secret => b, :provider => "fatsecret")
    res
  end

  let(:user2) do
    res = User.new(:email => "#{rand(100000000000000)}@fun.com", :password => "dfgdfgdfgdgfghfghfgh")
    a = "dbb8c110295d4dfaa8c386377d2e05e9"
    b = "c11b0047d2394bbf91dd27f6e9f45d98"
    res.save!
    res.identities.create(:access_token => a, :access_secret => b, :provider => "fatsecret")
    res
  end

  describe "GET index" do
    before do
      user; user2
      @request.env["devise.mapping"] = Devise.mappings[:user]  
    end

    it "smoke" do
      2.should == 2
    end

    it 'show' do
      get :show, :id => user.id
      assigns(:user).email.should == user.email
    end

    describe 'password' do
      let(:new_password) { "pass#{rand(1000000000000)}" }

      it 'change password' do
        put :update, :id => user.id, :user => {:password => new_password}, :auth_token => user.authentication_token
        user.reload
        user.should be_valid_password(new_password)
      end

      it 'change password without login fails' do
        put :update, :id => user.id, :user => {:password => new_password}
        user.reload
        user.should_not be_valid_password(new_password)
      end
    end
  end
end