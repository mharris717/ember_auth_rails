class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :authentication_token, :providers

  def providers
    object.identities.inject({}) do |h,i|
      h.merge(i.provider => true)
    end
  end
end