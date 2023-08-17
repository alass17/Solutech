class Produit < ApplicationRecord
    has_many :mesproduits
    has_many :commandes, through: :mesproduits
    belongs_to :categorie
end
