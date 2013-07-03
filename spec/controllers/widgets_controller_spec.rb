require 'spec_helper'

describe WidgetsController do
  include_context "users"

  let(:widgets) do
    res = []
    res << Widget.create!(:color => "Blue", :price => 20, :user => user)
    res << Widget.create!(:color => "Green", :price => 25, :user => user)
    res << Widget.create!(:color => "Red", :price => 30, :user => user2)
    res
  end

  before do
    widgets
  end

  it 'valid user' do
    get :index, :auth_token => user.authentication_token
    assigns(:widgets).size.should == 2
  end

  it 'no user' do
    get :index
    assigns(:widgets).should be_nil
  end
end