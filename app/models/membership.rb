class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :charge, presence: true
  validates_uniqueness_of :gym_id, scope: :client_id
  
end