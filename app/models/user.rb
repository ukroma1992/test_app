class User < ApplicationRecord

  has_one :team, dependent: :destroy
  
end
