class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :apparels, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :rentals_as_owner, through: :apparels, source: :rentals

  def self.search(query)
    where("name LIKE ?", "%#{query}%")
  end
end
