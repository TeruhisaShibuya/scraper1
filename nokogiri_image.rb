 require 'open-uri'  #指定URL開く
 require 'nokogiri'  #スクレイピング準備
    
    #ここからはデータベースに保存する方法… 下のimg_urlを全て保存
    #まずはSQliteを使用する宣言とテーブル作成の宣言無ければテーブル作るよという意味
    #db = SQLite3::Database.new('items.db')
    #db.execute('CREATE TABLE IF NOT EXISTS itemsupdate (title varchar(100))')
    #クローリング先
    #urls = [ "https://www.sigrun-woehr.com/en/New-Arrivals/" ]
     #動作オプション→一日に一回クローリング  データベースはSQliteを指定
 #options = {
  #:delay => 86400,
  #:strage => Anemone::strage::SQlite(),
#}

    #スクレイピング先URL
    url = 'https://www.sigrun-woehr.com/en/New-Arrivals/'
    
    charset = nil
    html = open(url) do |f|
     charset = f.charset   #文字種別を取得
     f.read   #htmlを読み込んで変数htmlに渡す
    end 
  
    #nokogiri先のURLを指定してパース doc内に格納
    doc = Nokogiri::HTML.parse(html, nil, charset)
    
      # <a> タグの中の <img>の値のみを返す リンク先の文字を返す！！
      doc.css('a').css('img').each do |f|  
      
        # img_urlの定義とfの定義 fはソースに起因する。そしてその値を返せ
        image = f.attribute('src').value
        
          #img_urlを表示しろ！！
          puts image
      end
      
       #newはhashで渡す…２つのカラムに保存する場合ははコンマ区切る
            #@image = Items.new(:image_url => image_url, :image => image_url) 
            @image = Item.new(:image => image) 
            @image.save
    
     
      
            #SQliteへの保存
            #db.execute 'INSERT INTO itemsupdate values ( ? )', ["#{title.('img_url').string}"]
            