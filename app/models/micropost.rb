class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit:
      Settings.image.resize_to_limit
  end
  default_scope ->{order(created_at: :desc)}
  validates :user_id, presence: true
  validates :content, presence: true, length:
    {maximum: Settings.digits.digit_140}
  validates :image,
            content_type: {in: Settings.image.content_type,
                           message: I18n.t("micropost.errors.content_type")},
            size: {less_than: Settings.image.max_size.megabytes,
                   message: I18n.t("micropost.errors.image_size")}
end
