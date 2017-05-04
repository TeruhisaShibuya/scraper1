#where ＆eachで　データを頭から引っ張る
#過去のクーリングデータは past_crawl　最新のクローリングデータはnew_crowlとする
#equalメソッドで比較する
#比較結果がfalseの部分はホーム画面に表示する

 
  #1日前のクローリング結果
  @past_crawl = Items.where(created_at: 1.day.ago.all_day) #ハッシュ指定 これで昨日のクローリングのデータ全てを配列形式で取得??
  
  #本日のクローリングにて！！
  @new_crowl = Items.scope :created_today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
  
  
  #過去のクローリングと現在のクローリング結果の比較を行う
  #image_urlカラムを比較して差分を発見。差分はviewに渡す
  @update = array();
  
  @new_crawl.each do |f|
    #もし差分があったら
    if @past_crawl.has_value?(f.image_url) == false
    @update[] = f.image_url
    end
  end
  
  

  
