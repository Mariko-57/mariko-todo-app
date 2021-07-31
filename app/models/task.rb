class Task < ApplicationRecord
  has_one_attached :eyecatch

  validates :title, presence: true
  validates :content, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :board
end
