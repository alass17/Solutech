require 'rails_helper'

RSpec.describe Produit, type: :model do
  describe 'Test de Validation' do
    context 'Si le nom du produit est une chaîne vide' do
      it 'Validation échoue' do
        produit = Produit.create(nom: '', description: 'Description du produit', prix: 1000, stock: 5, categorie_id: 1)
        expect(produit).not_to be_valid
      end
    end

    context 'Si la description du produit est vide' do
      it 'Validation échoue' do
        produit = Produit.create(nom: 'Nom du produit', description: '', prix: 1000, stock: 5, categorie_id: 1)
        expect(produit).not_to be_valid
      end
    end

    context 'Si le prix du produit est absent' do
      it 'Validation échoue' do
        produit = Produit.create(nom: 'Nom du produit', description: 'Description du produit', prix:'' , stock: 5, categorie_id: 1)
        expect(produit).not_to be_valid
      end
    end

    context 'Si la catégorie du produit est absente' do
      it 'Validation échoue' do
        produit = Produit.create(nom: 'Nom du produit', description: 'Description du produit', prix: 1000, stock: 5, categorie_id:'' )
        expect(produit).not_to be_valid
      end
    end

    context 'Si tous les attributs du produit ont des valeurs valides' do
      it 'Vous pouvez enregistrer un produit' do
        categorie = Categorie.create(nom:'fghjh', description:'gfghjklmkjh')
        produit = Produit.create(nom: 'Nom produit', description: 'Description du produit', prix: 1000, stock: 5, categorie_id: categorie.id)
        expect(produit).to be_valid
      end
    end
  end

  describe 'associations' do
    it { should belong_to(:categorie) }
    # Add other association tests if needed
  end

  # Add more tests as needed for other model behavior
end
