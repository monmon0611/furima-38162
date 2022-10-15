FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_katakana_name   {"カナ"}
    last_katakana_name    {"モジ"}
    date_of_birth         {"1111-11-11"}
  end
end