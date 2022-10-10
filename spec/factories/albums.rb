FactoryBot.define do

  factory :album do
    title { '台湾' }
    visited_on { '2022-10-01' }
    published { true }
  end

  factory :second_album, class: Album do
    title { 'カナダ' }
    visited_on {'2022-12-01'}
    published { true }
  end

  factory :third_album, class: Album do
    title { '北海道' }
    visited_on {'2022-11-01'}
    published { true }
  end

end