#クローラー試作
#coding: utf-8

 require 'anemone'

 #クロールURLを指定
 urls = [ "https://www.sigrun-woehr.com/en/New-Arrivals/" ]
 
 #一日に一回クローリングする
 options = {
  :delay => 86400,
  :strage => Anemone::strage::SQlite(),
}
 
 
 Anemone.crawl(urls,:depth_limit => 1 ) do |anemone|
        
        
       anemone.focus_crawl do |page|
         page.links.keep_if { |link|
           link.to_s.match(/435-bombers/) }
        end
       
      
     
       #取得したページに対する処理
       anemone.on_every_page do |page|
         puts page.url
       end
    end

 
 