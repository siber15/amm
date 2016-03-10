class Pier < ActiveRecord::Base
  belongs_to :harbour
  has_many :slips

  validates :name, presence: true
end
