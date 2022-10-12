FactoryBot.define do
  factory :tag do
    name { 'タグ1'}
  end

  factory :second_tag, class: Tag do
    name { 'タグ2'}
  end

  factory :third_tag, class: Tag do
    name { 'タグ3'}
  end
end
