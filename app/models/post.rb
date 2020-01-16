class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user, optional: true,class_name: "User" 
  has_many :photos, dependent: :destroy, autosave: true 
  accepts_nested_attributes_for :photos, allow_destroy: true
  # mount_uploader :image, ImageUploader
  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    # else
      Post.all
    end
  end
end
