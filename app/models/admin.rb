class Admin < ApplicationRecord

  before_save {self.username = username.downcase}

  validates :username, presence: true, length: {minimum: 3, maximum: 25},
            uniqueness: {case_sensitive: false}

  has_secure_password
end
