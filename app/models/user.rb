class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 24, minimum: 4 }, uniqueness: true
end
