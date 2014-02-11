class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :restaurants
  has_many :social_accounts

  def apply_omniauth(auth)
    social_accounts.build(provider: auth['provider'], uid: auth['uid'], token: auth['credentials']['token'])
  end
end
