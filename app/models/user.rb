class User < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :adcoms, dependent: :destroy

  scope :is_admin, -> {where(admin: true)}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: %i[facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  This method finds or creates a new user when they register. The name_split part of for those that store the first_name and last_name of their users.
         def self.from_omniauth(auth)
          name_split = auth.info.name.split(" ")
          user = User.where(email: auth.info.email).first
          user ||= User.create!(provider: auth.provider, uid: auth.uid,  email: auth.info.email, password: Devise.friendly_token[0, 20])
            user
        end
end
