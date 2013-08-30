require 'spec_helper'

describe EmberUsersController do
  include_context "users"

  describe "GET index" do
    it 'show' do
      get :show, :id => user.id, :auth_token => user.authentication_token
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