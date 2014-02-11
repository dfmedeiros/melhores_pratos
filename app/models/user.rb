class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
  :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  mount_uploader :avatar, LogoUploader

  has_many :restaurants
  has_many :social_accounts, dependent: :destroy

  validates :name, presence: true

  def apply_omniauth(auth)
    self.name = auth['info']['name']
    self.remote_avatar_url = auth['info']['image']

    social_accounts.build(provider: auth['provider'],
                          uid: auth['uid'],
                          token: auth['credentials']['token'],
                          secret: auth['credentials']['secret'])
  end
end
