  class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :omniauthable, omniauth_providers: %i[google]

  has_many :likes
  has_many :shops, through: :likes
  has_many :rates
  has_many :shops, through: :rates
  has_many :comments
  has_many :logs

  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    user ||= User.create(name: auth.info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         token: auth.credentials.token,
                         password: Devise.friendly_token[0, 20],
                         meta: auth.to_yaml)
    user
  end

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(
      uid: auth.uid,
      provider: auth.provider,
      email: User.dummy_email(auth),
      password: Devise.friendly_token[0, 20],
      image: auth.info.image,
      name: auth.info.name,
      nickname: auth.info.nickname,
      location: auth.info.location
    )

    user
end

  def self.find_for_facebook_oauth(auth, _signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.create(name: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0, 20])
    user
   end

  def self.find_for_twitter_oauth(auth, _signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.create(name: auth.info.nickname,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: User.create_unique_email,
                         password: Devise.friendly_token[0, 20])
    user
  end

  # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end

  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    User.create_unique_string + '@example.com'
  end
end
