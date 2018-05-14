class User < ApplicationRecord

  validates :firstname, presence: true

  validates :lastname, presence: true

  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

end
