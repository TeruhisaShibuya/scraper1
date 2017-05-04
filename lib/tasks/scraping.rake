namespace :scraping do
        desc "商品画像のスクレイピングを実行する"
        task populate: :environment do

        require 'open-uri' 
        require 'nokogiri'
        #URL変えると20行目が NoMethodError: undefined method `value' for nil:NilClass
        url = "https://www.antonia.it/237-what-s-new"
         
        charset = nil
        html = open(url) do |f|
        charset = f.charset   
        f.read   
        end 
          
        doc = Nokogiri::HTML.parse(html, nil, charset) 

        doc.css('a').css('img').each do |f|             
          newin_image = f.attribute('src').value
          newin_url   = f.parent.attribute('href').value 
          newin_brand = f.parent.parent.parent  
          
          puts "imageとれてる?↓----------"
          puts newin_image
          puts "urlとれてる?↓============"
          puts newin_url
          puts "brandとれてる?↓~~~~~~~~~~"
          puts newin_brand
          end
            #puts "スタート----------"
            
            #puts "エンド=========="    
            #ここまでのputsでブランド名を含むところまではnokogoriでスクレイピンできてる
            
             brands = ["Gucci" ] #ブランドのデータ
             
             str = newin_brand.to_s
           
             #puts str
              
             brands.each do |brand|
                 if str.include?(brand)
                  
                  puts "--------------------------------------"
                  puts brand + "が一致"  #分かるようにブランド名+文字列表示
                  puts"----------------------------------------"
                  
                  @new = Item.new(:link_url => newin_url, :image_url => newin_image, :brands => brand )
                  @new.save
                  
                 end  #ifのend
             end      #eachのend
             
             
                     
               # @All_Brand_Name.each do |brand|
                    
                #  if str.match(brand) === true
                   
             #     end   #33行目のend
            #    end     #32行目のend
               #end         #31行目のend
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

 