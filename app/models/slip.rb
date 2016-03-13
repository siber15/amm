class Slip < ActiveRecord::Base
  belongs_to :pier
  has_many :devices
end
