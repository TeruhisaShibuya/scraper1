 require 'open-uri'  #指定URL開く
 require 'nokogiri'  #スクレイピング準備
    
  html = open('https://www.sigrun-woehr.com/en/New-Arrivals/') do |data|
  data.read
end
 
doc = Nokogiri::HTML.parse(html)
doc.css('a').each do |anchor|
  p anchor[:href]
end
  
           #newはhashで渡す…２つのカラムに保存する場合ははコンマ区切る
          @image_url = Item.new(:image_url => anchor[:href]) 
          @image_url.save  
 
 