class Slip < ActiveRecord::Base
  belongs_to :pier
  has_one :device
end
