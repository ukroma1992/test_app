class User < ApplicationRecord

  has_one :team, dependent: :destroy

  validates :nickname, presence: true
  validates :uid, presence: true

  def self.find_or_create_from_omniauth(auth)
    find_or_create_by(uid: auth.uid) do |user|
      user.nickname  = auth.info.nick
      user.email = auth.info.email
    end
  end

  def to_s
    nickname
  end

  ##
  # Whether user has a team and particularly this team if the argument is provided.
  #
  # @param [Team] team
  # @return [Boolean]
  #
  def have_team?(team = nil)
    team ? self.team == team : self.team.present?
  end

end
