class Commande < ApplicationRecord
    has_many :mesproduits
  has_many :produits, through: :mesproduits

  belongs_to :user
end
