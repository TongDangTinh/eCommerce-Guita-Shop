class Instrument < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON

  belongs_to :user, optional: true

  validates :title, :brand, :price, :model, presence: true
  validates :decription, length: { maximum: 1000, too_long: "%{count} characters 
    is the maximum allow" }
  validates :title, length: { maximum: 140, too_long: "%{count} characters is 
    the maximum allow" }
  validates :price, numericality: { only_integer: true }, length: { maximum: 10 }

  BRAND = %w{ Fender Gibson Epiphone ESP Martin Dean Taylor Jackson PRS }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

end
