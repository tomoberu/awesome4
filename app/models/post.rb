class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user

  # mount_uploader :image, ImageUploader
  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    # else
      Post.all
    end
  end
end
