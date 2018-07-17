class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  default_scope ->{order(created_at: :desc)}
  scope :by_entry_id, ->(entry_id){where "entry_id = ?", entry_id}
  validates :content, presence: true,
    length: {maximum: Settings.validate.micropost.content.maxlength}
end
