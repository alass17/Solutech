class Categorie < ApplicationRecord
    has_many :produits
    has_one_attached :image
end
