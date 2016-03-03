class Pier < ActiveRecord::Base
  belongs_to :harbour
  #correct below?
  has_many :device
end
