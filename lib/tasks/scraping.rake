namespace :scraping do
        desc "商品画像のスクレイピングを実行する"
        task populate: :environment do

        require 'open-uri' 
        require 'nokogiri'
        url = "https://www.sigrun-woehr.com/en/Shoes/"
         
        charset = nil
        html = open(url) do |f|
        charset = f.charset   
        f.read   
        end 
          
        doc = Nokogiri::HTML.parse(html, nil, charset)             #HTMLをパースしてdocへ入れる
        doc.css('a').css('img').each do |f|                        #なかにimgが入っているaタグをみっけたらループに入る
          newin_image = f.attribute('src').value
          newin_url   = f.parent.attribute('href').value
          newin_brand = f.parent.parent.parent
        
            #puts "スタート----------"
            #puts newin_brand
            #puts "エンド=========="    
            #ここまでのputsでブランド名を含むところまではnokogoriでスクレイピンできてる
            
             brands = ["Bottega Veneta" ] #ブランドのデータ
             
             str = newin_brand.to_s
             
             #puts str
              
             brands.each do |brand|
                 if str.include?(brand)
                  
                  puts "--------------------------------------"
                  puts brand + "が一致"  #分かるようにブランド名+文字列表示
                  puts"----------------------------------------"
                  
                  @new = Item.new(:link_url => newin_url, :image => newin_image, :brand => brand )
                  @new.save
                  
                 end
             end
             
             
                     
               # @All_Brand_Name.each do |brand|
                    
                #  if str.match(brand) === true
                   
             #     end   #33行目のend
            #    end     #32行目のend
              end       #31行目のend
              #    newin_brand = @All_Brand_Name
                
                 # puts = newin_brand
                
               #   @new = Item.new
                #  @new = Item(:link_url => newin_url, :image => newin_image, :brand => newin_brand )
                 # @new.save
              #  end   # if文のend
              #end     # newin_brand.eachのend
             end      # doc.cssのend
          end         # enviroment do のend
               # 最初のend