# require 'rails_helper'

# RSpec.describe 'Création de produits en tant qu\'administrateur', type: :system do

#   before do
#     categories = Categorie.all

#       visit new_user_session_path
#       fill_in "Email", with: second_user.email
#       fill_in "Password", with: "password"
#       click_button "Log in"
#   end

#   it 'crée un produit avec des informations valides' do
#     categories = Categorie.all
#     visit new_produit_path
#     fill_in 'Nom', with: 'Nouveau Produit'
#     fill_in 'Description', with: 'Description du produit'
#     fill_in 'Prix', with: 10.99
#     fill_in 'Stock', with: 50
#     select 'Imprimante', from: 'Catégorie'
#     click_button 'Enregistrer'
    
#     expect(page).to have_content('Le produit a été créé avec succès.')
#     expect(page).to have_content('Nouveau Produit')
#   end

#   it 'affiche des erreurs si les informations sont manquantes' do
#     click_button 'Enregistrer'
    
#     expect(page).to have_content('prohibited this product from being saved')
#     expect(page).to have_content("Nom can't be blank")
#   end

#   # Ajoutez d'autres tests ici pour couvrir différents scénarios, par exemple, des erreurs de validation spécifiques.
# end

require 'rails_helper'

RSpec.describe 'Création de produits en tant qu\'administrateur', type: :system do
  
  before do

    driven_by :rack_test

  end
  describe "Fonction de creation de produit" do
    before do
      user=User.create(email: 'user@gmail.com',password:'password',password_confirmation:'password',nom:"didi",admin:true)
      visit new_user_session_path
      fill_in "Email", with: "user.email"
      fill_in "Password", with: "password"
      click_button "Log in"
    end

    context "Lors de la creation d'un produit" do
      it "Le produit enregistré s'affiche" do
        visit new_produit_path

        fill_in 'Nom', with: 'hjbnnkjj'
        fill_in 'Description', with: "hhhhhhh"
        fill_in 'Prix', with: 100
        fill_in 'Stock', with: 3
        select 'Imprimante', from: "produit[categorie_id]" 
        click_button "Enregistrer"
        visit produits_path 
        expect(page).to have_content "Produits"
      end
    end
  end
end
