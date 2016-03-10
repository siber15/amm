class Slip < ActiveRecord::Base
  belongs_to :pier
  has_many :device
end
