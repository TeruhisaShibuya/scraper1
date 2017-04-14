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
    url = 'https://www.sigrun-woehr.com/en/Bags-Accessoires/'
    
    charset = nil
    html = open(url) do |f|
     charset = f.charset   #文字種別を取得
     f.read   #htmlを読み込んで変数htmlに渡す
    end 
    
    doc = Nokogiri::HTML.parse(html, nil, charset)
  
    #nokogiri先のURLを指定してパース doc内に格納
    doc.css('a').css('img').each do |src| #なかにimgが入っているaタグをみっけたらループに入る
              newin_image = src.attribute('src').value
              newin_url = src.parent.attribute('href').value
              
              puts 'ここから'
              puts '画像の文字列'
              puts newin_image
              puts 'と'
              puts 'リンク先'
              puts newin_url
              puts '---------'
      end
      
       #newはhashで渡す…２つのカラムに保存する場合ははコンマ区切る
            #@image = Items.new(:image_url => image_url, :image => image_url) 
           # @image = Item.new(:image => image) 
            #@image.save
    
     
      
            #SQliteへの保存
            #db.execute 'INSERT INTO itemsupdate values ( ? )', ["#{title.('img_url').string}"]
            