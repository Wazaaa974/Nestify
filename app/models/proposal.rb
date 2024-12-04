class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :package
  scope :favorite, -> { where(:favorite => true) }
end
