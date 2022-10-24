class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

has_many :items

KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

validates :nickname,             presence: true
validates :password,            format: { with: VALID_PASSWORD_REGEX }

with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
  validates :first_name          
  validates :last_name          
end

validates :first_katakana_name, presence: true, format: { with: KATAKANA_REGEXP }
validates :last_katakana_name,  presence: true, format: { with: KATAKANA_REGEXP }
validates :date_of_birth,       presence: true
end