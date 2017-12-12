class Member < ApplicationRecord

  belongs_to :team
  belongs_to :tournament

  validates :team_id,       uniqueness: { scope: %i[team_id tournament_id] }
  validates :tournament_id, uniqueness: { scope: %i[team_id tournament_id] }

end
