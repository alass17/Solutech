class Orderable < ApplicationRecord
  belongs_to :produit
  belongs_to :cart

  def total
    produit.prix * quantity
  end
end