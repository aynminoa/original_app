# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
  name = Gimei.unique.first.katakana
  email = Faker::Internet.email
  password = "password"
  User.create!(
    name:         name,
    email:        email,
    password: password
  )
end

User.create!(
  name: 'アユミ',
  email: 'ayumi@example.com',
  password: 123456,
  admin: true,
  id: 4,
)

User.create!(
  name: 'ナゴミ',
  email: 'nagomi@example.com',
  password: 123456,
  admin: false,
  id: 5,
)

Album.create!(
  [
    {
      title: '台北',
      visited_on: '2022-10-01',
      user_id: 4,
      published: true
    },
    {
      title: 'バンクーバー',
      visited_on: '2022-08-01',
      user_id: 4,
      published: true
    },
    {
      title: '札幌',
      visited_on: '2022-04-01',
      user_id: 5,
      published: true
    },
    {
      title: 'バンコク',
      visited_on: '2022-09-01',
      user_id: 4,
      published: false
    },
    {
      title: 'フランス',
      visited_on: '2022-03-01',
      user_id: 4,
      published: false
    },
    {
      title: '長崎',
      visited_on: '2022-05-01',
      user_id: 4,
      published: true
    },
    {
      title: '沖縄',
      visited_on: '2022-06-01',
      user_id: 5,
      published: true
    },
  ]
)

albums = Album.all
Spot.create!(
  [
    {
      name: '好記擔仔麵',
      address: '台湾 台北市 中山区 Jilin Road, 好記擔仔麵',
      visited_on: '2022-10-05',
      url: 'https://www.taipeinavi.com/food/39/',
      comment: '2人分で4,000円そこそこ。コスパ良い。',
      category: '食事',
      album_id: albums[0].id,
    },
    {
      name: '鼎泰豐',
      address: '台湾 台北市 中正区 Section 2nd, Xinyi Road, 鼎泰豐 新生店',
      visited_on: '2022-10-15',
      url: 'https://www.dintaifung.com.tw/jp/index.php',
      comment: 'さすが有名店。小籠包以外も美味しい。',
      category: '食事',
      album_id: albums[0].id,
    },
    {
      name: '三元號',
      address: '台湾 台北市 大同区 Section 2nd, Chongqing North Road',
      visited_on: '2022-10-06',
      url: 'https://petit-tw.jp/san-yuan-hau/',
      comment: '迪化街への寄り道にもよさそう。',
      category: '食事',
      album_id: albums[0].id,
    },
    {
      name: '好奇營養豆花',
      address: '台湾 台北市 士林区 徳行東路 好奇營養豆花',
      visited_on: '2022-10-10',
      url: 'https://www.facebook.com/profile.php?id=100064072153155',
      comment: 'マンゴーかき氷はこの店が最高！',
      category: 'スイーツ',
      album_id: albums[0].id,
    },
    {
      name: '手天品',
      address: '台湾 台北市 大安区 Chaozhou Street',
      visited_on: '2022-10-11',
      url: 'https://www.instagram.com/shoutianpin/',
      comment: 'パイナップルケーキの隠れ名店。クルミ入りとかもあって最高。',
      category: 'スイーツ',
      album_id: albums[0].id,
    },
    {
      name: 'Stepho\'s Souvlaki Greek Taverna',
      address: 'Stepho\'s Souvlaki Greek Taverna, ロブソン通り バンクーバー',
      visited_on: '2022-08-01',
      url: 'https://canadining.com/stephos/',
      comment: '並ぶけど、絶対行くべき。',
      category: '食事',
      album_id: albums[1].id,
    },
    {
      name: 'Blenz Coffee',
      address: 'Blenz Coffee, ロブソン通り バンクーバー ブリティッシュコロンビア州 カナダ',
      visited_on: '2022-08-02',
      url: 'https://blenz.com/',
      comment: 'フードやスイーツも充実していて、休憩にピッタリ。',
      category: 'カフェ',
      album_id: albums[1].id,
    },
    {
      name: 'Jang Mo Jib Korean Restaurant',
      address: 'Jang Mo Jib Korean Restaurant, ビュート・ストリート バンクーバー ブリティッシュコロンビア州 カナダ',
      visited_on: '2022-08-03',
      url: 'https://www.jangmojibca.com/',
      comment: '本格的な韓国料理が食べられる。現地人も多く来ている。',
      category: '食事',
      album_id: albums[1].id,
    },
    {
      name: 'グランビルアイランド',
      address: 'カナダ ブリティッシュコロンビア州 バンクーバー グランビル・アイランド',
      visited_on: '2022-08-04',
      url: 'https://granvilleisland.com/',
      comment: 'いろいろな店があって楽しいけれど、いつも混んでいる。観光といえば、まずココ。',
      category: '食事',
      album_id: albums[1].id,
    },
    {
      name: 'いただきます',
      address: '日本、北海道札幌市中央区南５条西５丁目１−６ いただきます。',
      visited_on: '',
      url: 'https://xn--u8jf3af20ad.net/',
      comment: '肉が薄くて小さい。味もあまりない。他の店のほうがいいかも。',
      category: '食事',
      album_id: albums[2].id,
    },
    {
      name: 'ソウルストア',
      address: '日本、北海道札幌市中央区南３条西７丁目３−４ ソウルストア',
      visited_on: '2022-04-01',
      url: 'https://soulstore.info/',
      comment: '開店前から並んだほうがいい。スープカレーの常識を覆す。',
      category: '食事',
      album_id: albums[2].id,
    },
    {
      name: '六花亭',
      address: '日本、北海道札幌市中央区北４条西６丁目３−３ 六花亭 札幌本店',
      visited_on: '2022-04-03',
      url: 'https://www.rokkatei.co.jp',
      comment: 'カフェで六花亭のスイーツが食べられる。店内もかわいい。',
      category: 'カフェ',
      album_id: albums[2].id,
    },
    {
      name: '長崎バイオパーク',
      address: '日本、長崎県西海市西彼町中山郷２２９１−１ 長崎バイオパーク',
      visited_on: '2022-05-03',
      url: 'http://www.biopark.co.jp/',
      comment: 'ミーアキャットは絶対見て。園内が広いので時間に余裕を。',
      category: 'その他',
      album_id: albums[5].id,
    },
  ]
)

Tag.create!(
  [
    { name: 'マスト' },
    { name: 'そこそこ' },
    { name: 'NG' },
    { name: '高級'},
    { name: 'お安め' },
    { name: 'ひとり' },
    { name: 'グループ' },
    { name: 'きたなオイシイ' },
  ]
)