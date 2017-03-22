class StaticPagesController < ApplicationController
  
  def home
    #1日前のクローリング結果
  @past_crawl = Items.where(created_at: 1.day.ago.all_day) #ハッシュ指定 これで昨日のクローリングのデータ全てを配列形式で取得??
  
  #本日のクローリングにて！！
  @new_crawl = Items.where("created_at >= ?", Time.zone.now.beginning_of_day)
  
  
  #過去のクローリングと現在のクローリング結果の比較を行う
  #image_urlカラムを比較して差分を発見。差分はviewに渡す
  
  @update = []
  @past_crawl.pluck(:image_url, :image) #image_urlとiimageカラムに配列のみ入れる→検索準備
  @new_crawl.each do |f|
    #もし差分があったら
    if @past_crawl.include?(f.image_url, f.image ) == false   #include(obj)メソッドでpluckで取得した配列内を検索
      @update << f   #fを@updateに入れる
    end
  end
  
    @update.each do |f|
    f.image_url
    f.image  #モデルの画像とURLカラムを表示
    end
  end
end