class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do

    validates :nickname

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email,
      uniqueness: true

    validates :password

    validates :first_name,
      format: { with: /\A[ぁ-んァ-ン一-龥]/ }

    validates :last_name,
      format: { with: /\A[ぁ-んァ-ン一-龥]/ }

    validates :first_name_kana,
      format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :last_name_kana,
      format: { with: /\A[ァ-ヶー－]+\z/ }

    validates :birth_date
    end
end
