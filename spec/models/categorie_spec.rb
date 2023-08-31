require 'rails_helper'

RSpec.describe Categorie, type: :model do
  describe 'Test de Validation' do
    context 'Si le nom de la categorie est une chaine vide' do
      it 'Validation echoue' do
        categorie = Categorie.create!(nom:'', description:'gfghjklmkjh')
        expect(categorie).to be_valid
      end
    end

    context 'Si la description de la categorie est une chaine vide' do
      it 'Validation echoue' do
        categorie = Categorie.create!(nom:'fghjh', description:'')
        expect(categorie).to be_valid
      end
    end
   
   
    context 'Si tous les attributs de la categorie ont des valeurs valides' do
      it 'Vous pouvez enregistrer une categorie' do
        categorie = Categorie.create!(nom:'fghjh', description:'gfghjklmkjh')
        expect(categorie).to be_valid
      end
    end
  end

  # Add more tests as needed for other model behavior
end
