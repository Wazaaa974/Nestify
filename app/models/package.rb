class Package < ApplicationRecord
  belongs_to :room
  belongs_to :style
  has_many :proposals
end
