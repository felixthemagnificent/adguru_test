FactoryBot.define do
  factory :ticket do
    title { "MyString" }
    description { "MyText" }
    user { nil }
  end
end
