class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  scope :all_order, ->{order(created_at: :desc)}
  scope :by_user_id, ->(user_id){where "user_id = ?", user_id}
  scope :feed_query, ->(ids){where user_id: ids}
  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.validate.micropost.content.maxlength}
  validates :title, presence: true,
    length: {maximum: Settings.validate.micropost.content.maxlength}
  validate  :picture_size
  mount_uploader :picture, PictureUploader

  private

  def picture_size
    return if picture.size < Settings.picture_size.megabytes
    errors.add :picture, t("microposts.error_picture")
  end 
end
