def fake_password
  "password123"
end

def make_user
  res = User.new(:email => "#{rand(100000000000000)}@fun.com", :password => fake_password)
  a = "dbb8c110295d4dfaa8c386377d2e05e9"
  b = "c11b0047d2394bbf91dd27f6e9f45d98"
  res.save!
  #res.identities.create(:access_token => a, :access_secret => b, :provider => "fatsecret")
  res
end

shared_context "users" do
  let(:user) { make_user }
  let(:user2) { make_user }
  let(:users) { [user,user2] }
  before do
    users
  end
end