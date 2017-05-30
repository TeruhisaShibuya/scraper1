class ItemsController < ApplicationController
    
    def compare
      yesterday = Item.find(:created_at => "yesterday")   #Newモデルを読み込めていないようですよ！ 
      puts yesterday
      today     = Item.find(:created_at => "today" )       #そしてpluckで複数カラムを引っ張るか  link_urlとcreated_at
      
      yester_link = yesterday.pluck(:link_url)
      today_link  = today.pluck(:link_url)
       
       
      today_link.each do |e_today_link| 
        if e_today_link.include(yester_link)
          puts "変化なし"
        else
          puts "新作です"
          @update = today_link
        end
      end
    end
    
    
    
    def new
      require 'open-uri'  
      require 'nokogiri'  
      sites = Site.all
      sites.each do |site|
        site_url = site.url
        site_crawl = site.crawl
        
        charset = nil
          html = open(site_url) do |x|  #urlは上で定義しているのでOK    
            charset = x.charset 
            x.read 
          end #11行目のend
            doc = Nokogiri::HTML.parse(html, nil, charset) 
            @doc = doc
           
            #docは配列オブジェクトなのでeachで回す
            doc.css('.' + site_crawl).each do |y|
             # puts y
              y.css('a').css('img').each do |z|
                  link_url = z.attribute("src").value            # Itemsのカラムへの代入値
                  image_url = z.parent.attribute("href").value   # Itemsのカラムへの代入値
                  db_brands = ["CHLOE", "Gucci"]   # brandsはデータベースの中に登録しているブランド群を指す
                  
                  #brand_name = ''
                  db_brands.each do |zz| 
                    if z.parent.parent.include?(zz) 
                      brand_name = zz
                      @item = Item.new(:link_url => link_url, :image_url => image_url, :brands => brand_name) 
                      @item.save
                    else
                      puts "対象外"  
                    end
                    end
                  end        
              end #38行目のend
            end
    end
end              #end #27行目 brands.eachのend
                  
                  #newはhashで渡す…２つのカラムに保存する場合はコンマで区切る
                  #brand_name.each do |brands|
                  #if brand_name.include?(brands) then
                  #if brand_name != '' then
                  
        #            
                   #27行目のend
                 #20行目eachのendｍ
     #18行目eachのend
    
        
     # end #sites.eachのend
    
     
 #   end #defのend
#end  #最初のend



=begin
        clawl_point = doc.match(crawls).value
  
        clawl_point.css('a').css('img').each do |f|
          link_url = f.attribute("src").value
          image_url = f.parent.attribute("href").value
          brands =  f.parent.parent.much(brands)
        end
    
    
      
    end #defのend
end #最初のend
    
    
    
=begin
    def create

    yesterday = Item.where(created_at: 1.day.ago.all_day) 
    
    #puts yesterday 動作OK
    
    today     = Item.where("created_at >= ?", Time.zone.now.beginning_of_day)
    
    #puts today 動作OK
  
    #過去のクローリングと現在のクローリング結果の比較を行う
    #image_urlカラムを比較して差分を発見。差分はviewに渡す
  
    @updates = []    #空配列 <- 配列だよ！

    yesterday_info = yesterday.pluck(:link_url)  #pluckでlink_urlカラムの配列を得る
    
    puts "--------ここから昨日の結果----------"
    puts yesterday_info 
    puts "--------ここまでが昨日の結果----------"
    
    today_info = today.pluck(:link_url)
    
    puts "--------ここから今日の結果----------"
    puts today_info
    puts "--------ここまでが今日の結果----------"
    


    today_info.each do |f| 
      
      yesterday_info.each do |y|
        if f.include?(y)
          puts "更新無し"
            unless 
              puts "新作入荷あり"
              
              @updates << Item.new(link_url: link_url, image_url: image_url, brands: brands) #todayの情報を空の配列内に保存
              @updates.save
            
            end  #unlessのend
        end    #ifのend
      end     #eachアクションのend
    end
      redirect_to(root_url)
    end      #defのend
end        #継承のend
=end