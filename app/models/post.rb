# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 5..30 }
  validates :body, presence: true, length: { maximum: 250 }
end
