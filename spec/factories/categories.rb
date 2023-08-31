FactoryBot.define do
  factory :categorie do
second_user
    nom { 'dell' }
    description { 'Dell latitude avec 8gb de ram et 125GB SSD' }
    
    image { Faker::LoremFlickr.image(size: "300x300", search_terms: ['Categorie']) }
  end
  factory :second_categorie, class: Categorie do
    second_user
    nom { 'Mac' }
    description { 'MacBook pro avec 8gb de ram et 125GB SSD' }
  end

  factory :third_categorie, class: Categorie do
    second_user
    nom { 'Lenovop' }
    description { 'Lenovo clavier lumineux avec 16gb de ram et 256GB SSD' }
    
    image { Faker::LoremFlickr.image(size: "300x300", search_terms: ['Categorie']) }
  end


end
