FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '193adsfada2' }
    password_confirmation { password }
    last_name             { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    last_name_kana        { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birth_date            { '1932-04-05' }
  end
end
