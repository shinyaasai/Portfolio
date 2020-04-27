class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true, length: { maximum: 10 }, uniqueness: true

  has_many :records, dependent: :delete_all
  has_many :dream_posts, dependent: :delete_all
  has_many :comments
end
