class Team < ApplicationRecord
  scope :in_tournament, ->(tournament) { tournament.teams }

  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :tournaments, through: :members

  validates :name, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader

end
