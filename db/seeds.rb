# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 既存のデータを一度削除して、重複を防ぎます
Shop.destroy_all

# あなたの index.html.erb にあった店名に合わせたデータを作成します
shops = [
  { name: "かやの森cafe", description: "近大生に人気の落ち着いたカフェ。勉強やランチに最適です。", rating: 4, recommended: true },
  { name: "Joyfull", description: "安くて美味しい定番のファミレス。24時間営業で便利。", rating: 3, recommended: false },
  { name: "モスバーガー", description: "注文を受けてから作る、素材にこだわったハンバーガー。", rating: 4, recommended: false },
  { name: "ピザハット", description: "アツアツのピザをみんなでシェア！テイクアウトもお得。", rating: 3, recommended: false },
  { name: "スシロー", description: "安くて新鮮な回転寿司。常に賑わっている人気店です。", rating: 5, recommended: true },
  { name: "どんどん亭", description: "自分でお好み焼きを焼いて楽しめる、活気あるお店。", rating: 4, recommended: false },
  { name: "とんかつ濵かつ", description: "サクサクのとんかつ。キャベツやお味噌汁がおかわり自由！", rating: 4, recommended: false },
  { name: "ジョリーパスタ", description: "パスタの種類が豊富。季節限定メニューもおすすめ。", rating: 3, recommended: false },
  { name: "炭火焼肉嘉苑", description: "コスパ抜群の焼肉。お腹いっぱいお肉を食べたい時に。", rating: 5, recommended: true }
]

# データを一つずつ作成
shops.each do |shop_data|
  Shop.create!(shop_data)
end

puts "Success: #{Shop.count} shops have been created!"