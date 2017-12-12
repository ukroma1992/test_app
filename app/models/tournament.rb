class Tournament < ApplicationRecord

  has_many :members, dependent: :destroy
  has_many :teams, through: :members

  validates :name, presence: true

end
