class Message < ApplicationRecord
  validates :text, presence: true, if: -> { image.blank? }
  validates :image, presence: true, if: -> { text.blank? }
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader
end
