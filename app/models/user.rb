class User < ApplicationRecord
  has_many :tips
  has_many :comments
  has_secure_password
  has_and_belongs_to_many :favourites, class_name: 'Tip'
  mount_uploader :avatar, AvatarUploader
  validates :role, inclusion: { in: %w(registered admin) }

  validates :email, presence: true,
                    uniqueness: true

  after_initialize :default_role!
  before_validation :downcase_email

  paginates_per 6

  private

    def downcase_email
      self.email = email.downcase
    end

    def default_role!
      self.role ||= 'registered'
    end
end
