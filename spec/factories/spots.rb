FactoryBot.define do

  factory :spot do
    id { Album.first.id }
    name { '鼎泰豊' }
    address { '台湾台北市大安区信義路二段194號' }
    visited_on { '2022-10-01' }
    url { 'https://www.dintaifung.com.tw/jp/index.php' }
    comment { 'さすが有名店。小籠包以外も美味しい。' }
    category { '食事' }

    after(:build) do |spot|
      tag = create(:tag)
      spot.spot_tags << build(:spot_tag, spot: spot, tag: tag)
    end
  end

  factory :second_spot, class: Spot do
    name { '阜杭豆漿' }
    address { '	台灣台北市中正區忠孝東路一段108號2F' }
    visited_on { '2022-10-02' }
    url { 'https://www.taipeinavi.com/food/28/' }
    comment { '朝ごはんにピッタリ。行列必至。' }
    category { '食事' }

  end

  factory :third_spot, class: Spot do
    name { 'グランビルアイランド' }
    address { '	Granville Island, Vancouver, BC V6H 3S' }
    visited_on { '2022-11-01' }
    url { 'https://granvilleisland.com/' }
    comment { 'いろいろな店があって楽しいけれど、いつも混んでいる' }
    category { 'その他' }
  end

end