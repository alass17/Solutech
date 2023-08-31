require 'rails_helper'

RSpec.describe Cart, type: :model do

    describe 'associations' do
      it { should have_many(:orderables) }
      it { should have_many(:produits).through(:orderables) }
    end
  
    describe '#total' do
      it 'calcule le prix total de tous les produits à commander' do
        
        categorie = Categorie.create(nom:'fghjh', description:'gfghjklmkjh')
        produit = Produit.create(nom: 'Nom produit', description: 'Description du produit', prix: 1000, stock: 2, categorie_id: categorie.id)
        second_produit = Produit.create(nom: 'produit2', description: 'Description du produit2', prix: 1500, stock: 5, categorie_id: categorie.id)
        orderable = Orderable.create( produit: produit, quantity: 2)
        second_orderable = Orderable.create( produit: second_produit, quantity: 3)
        cart = Cart.create(orderables: [orderable, second_orderable])

        expect(cart.total).to eq(2 * 1000 + 3 * 1500)
      end
    end
  end
  
  RSpec.describe Orderable, type: :model do
    describe 'associations' do
      it { should belong_to(:produit) }
      it { should belong_to(:cart) }
    end
  
    describe '#total' do
      it 'calcule le prix total du produit à commander' do
        categorie = Categorie.create(nom:'fghjh', description:'gfghjklmkjh')
        produit = Produit.create(nom: 'Nom produit', description: 'Description du produit', prix: 500, stock: 5, categorie_id: categorie.id)
        orderable = Orderable.create( produit: produit, quantity: 4)
  
        expect(orderable.total).to eq(4 * 500)
      end
    end
  end
  