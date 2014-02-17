class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
  :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  mount_uploader :avatar, UserAvatarUploader

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

  def password_required?
    super && encrypted_password.present?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
