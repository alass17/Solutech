FactoryBot.define do
  factory :produit do
  association :user, factory: :second_user
    nom { 'dell lattitude' }
    description { 'Dell latitude avec 8gb de ram et 125GB SSD' }
    prix { 2000 }
    stock {6}
    categorie_id {1}
    image { Faker::LoremFlickr.image(size: "300x300", search_terms: ['Produit']) }
  end
  factory :second_produit, class: Produit do
    association :user, factory: :second_user
    nom { 'Mac Book' }
    description { 'MacBook pro avec 8gb de ram et 125GB SSD' }
    prix { 4000 }
    stock {6}
    categorie_id {1}
    image { Faker::LoremFlickr.image(size: "300x300", search_terms: ['Produit']) }
  end

  factory :third_produit, class: Produit do
    association :user, factory: :second_user
    nom { 'Lenovop' }
    description { 'Lenovo clavier lumineux avec 16gb de ram et 256GB SSD' }
    prix { 4000}
    stock {6}
    categorie_id {1}
    image { Faker::LoremFlickr.image(size: "300x300", search_terms: ['Produit']) }
  end


end
