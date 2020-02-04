class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 24, minimum: 4 }, uniqueness: true
  validates :password,
    presence: true,
    length: { maximum: 20, minimum: 4 },
    format: {
      with: /\A[a-z0-9]+\z/,
      message: "は小文字英数字で入力して下さい。"
    }
end
