class Categoryuser < ApplicationRecord
  belongs_to :Category
  belongs_to :user
end
