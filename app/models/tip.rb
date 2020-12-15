class Tip < ApplicationRecord
  belongs_to :user
  has_many   :comments

  has_and_belongs_to_many :users

  validates :title, presence: true,
                    length: { maximum: 100 }
  validates :body,  presence: true

  scope :most_recent,           -> { order(created_at: :desc).limit(4) }
  scope :title_contains,        ->(term) { where('title LIKE ?', "%#{term}%") }
  scope :description_contains,  ->(term) { where('body LIKE ?', "%#{term}%") }
  scope :search,                ->(search_term) { title_contains(search_term).or(description_contains(search_term)) }

  paginates_per 8

end
