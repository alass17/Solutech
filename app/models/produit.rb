class Produit < ApplicationRecord
    has_one_attached :image
    has_many :mesproduits
    has_many :commandes, through: :mesproduits
    belongs_to :categorie

    has_many :orderables
    has_many :carts, through: :orderables
    
end
