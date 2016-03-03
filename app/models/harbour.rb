class Harbour < ActiveRecord::Base
  has_many :piers

  validates :name, presence: true
end
