class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

validates :nicname,             presence: true
validates :password,            format: { with: VALID_PASSWORD_REGEX }
validates :first_name,          presence: true
validates :last_name,           presence: true
validates :first_katakana_name, presence: true, format: { with: KATAKANA_REGEXP }
validates :last_katakana_name,  presence: true
validates :date_of_birth,       presence: true
end