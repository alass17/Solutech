FactoryBot.define do
  factory :user do

    email { 'didi@gmail.com'}
    password { '123456' }
    password_confirmation { '123456' }
    admin { false }
    nom {'didi'}
  end

  factory :second_user do
  
    email { 'dada@gmail.com' }
    password { '123456' }
    password_confirmation { '123456' }
    admin { true }
    nom {'dada' }
  end
end
