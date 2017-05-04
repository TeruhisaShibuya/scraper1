  require 'open-uri' 
  require 'nokogiri' 
  url = "https://www.sigrun-woehr.com/en/New-Arrivals/"
  
      
        charset = nil
        html = open(url) do |f|
          charset = f.charset 
          f.read 
        end  
            doc = Nokogiri::HTML.parse(html, nil, charset)  
            
            doc.kind_of?(String)
  
=begin
  
  
  
  
  
  
  sites = Site.pluck(:url) # <- 配列で返ってくる！
  puts sites


  sites.each do |url|
     #なにかしら
  end
  
  
  url = Site.url   #Siteモデルのurlカラムを参照してurlを開く
  
  charset = nil
    html = open(url) do |f|  #urlは上で定義しているのでOK    
    charset = f.charset 
    f.read 
  end 
    
  doc = Nokogiri::HTML.parse(html, nil, charset)  #docの中にはHTMLが全部入っている状態
    
    
    
  クローリング対象部分 = doc.match(:crawl).value
  
  puts クローリング対象部分 
    
    
    クローリング対象部分.css('a').css('img').each do |f|
      link_url = f.attribute("src").value
      image_url = f.parent.attribute("href").value
      brands =  f.parent.parent.much(brands)
    end
      
      
      
      
      
       #newはhashで渡す…２つのカラムに保存する場合ははコンマ区切る
            #@image = Items.new(:image_url => image_url, :image => image_url) 
           # @image = Item.new(:image => image) 
            #@image.save
    
     
      
            #SQliteへの保存
            #db.execute 'INSERT INTO itemsupdate values ( ? )', ["#{title.('img_url').string}"]
=end