class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, optional: true

  # mount_uploader :image, ImageUploader
  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    # else
      Post.all
    end
  end
end
