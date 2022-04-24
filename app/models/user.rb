class User < ApplicationRecord
  validates_presence_of :email, :password_digest
  validates_uniqueness_of :email, case_sensitive: false

  has_secure_password
end
