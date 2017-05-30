class StaticPagesController < ApplicationController
  
  def new
  end
  
  def index
  end
  
end

=begin
  @update = []
  @past_crawl.pluck(:image_url, :image) #image_urlとiimageカラムに配列のみ入れる→検索準備
  @new_crawl.each do |f|
    #もし差分があったら
    if @past_crawl.include?(f.image_url, f.image ) == false   #include(obj)メソッドでpluckで取得した配列内を検索
      @update << f   #fを@updateに入れる
    end
  end
  
    end
  end
end
  #1日前のクローリング結果
  #yesterday = Item.where(created_at: 1.day.ago.all_day) #ハッシュ指定 これで昨日のクローリングのデータ全てを配列形式で取得??
  #today = Item.where("created_at >= ?", Time.zone.now.beginning_of_day)
=end