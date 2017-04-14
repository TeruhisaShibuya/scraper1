brands = ["JIMMY CHOO" , "Gucci" , "Golden goose" , "Bottega Veneta"]  # ブランドのデータ

str = "JIMMY CHOOの財布"           # 検索対象の文字列

brands.each do |brand| 
  if str.include?(brand)
    puts brand + "が一致"       # 一致した時の処理
  end
end