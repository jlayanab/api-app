class Level < ApplicationRecord
  belongs_to :users, optional: true

  #validates :user_id, presence: true
  validates_presence_of :users_id
  validates_uniqueness_of :users_id
  
end
