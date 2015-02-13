class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :delete_all
  has_many :ingredients, through: :doses
  has_attached_file :picture,
    styles: { banner: "500x300>", medium: "380x380>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  validates :name, presence: true, uniqueness: true
end
