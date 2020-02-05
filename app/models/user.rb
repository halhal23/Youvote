class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_picture

  attribute :new_profile_picture

  validates :name, presence: true, length: { maximum: 24, minimum: 4 }, uniqueness: true

  validate if: :new_profile_picture do
    if new_profile_picture.respond_to?(:content_type)
      unless new_profile_picture.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_profile_picture, :invalid_image_type)
      end
    else
      errors.add(:new_profile_picture, :invalid)
    end
  end

  before_save do
    if new_profile_picture
      self.profile_picture = new_profile_picture
    end
  end
end
