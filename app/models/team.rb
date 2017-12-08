class Team < ApplicationRecord

  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :tournaments, through: :members
  
end
