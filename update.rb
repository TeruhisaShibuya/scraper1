yesterday = Item.find(:created_at => "yesterday 2014-4-14")   #Newモデルを読み込めていないようですよ！ 
today     = Item.find(:created_at => "today 2014-4-15")       #そしてpluckで複数カラムを引っ張るか  link_urlとcreated_at

@updates = []    #空配列 <- 配列だよ！

today.each do |f|
  if f.much(yesterday) 
    puts = "同一アイテム" 
    unless
    puts = "最新アイテムの入荷がありました"
    @updates[] = todays_url 
  end
end


=begin
old : 配列？←Item.find(日付)的な？で複数でてくるやーつ
1: img1, link1, brand1
2: img2, link2, brand2
3: ...

new : 配列？
1: img3, link3, brand3
2: img2, link2, brand2
3: ...
=end






new_crawl.each do |new_1行ずつ|
    if(matchできた){
        @updatesに行追加
    }
-> new-1 -> link3 -> これをもとにold側でmatch？
　　-> matchできなかった！ -> 新しいやつ
　　-> brandsとの比較などいらん！(なぜならDBに入れるときにもうbrandsから特定してるから！)
　　-> こいつは画面に出してやろう...　（画面に出すやーつ @updates)
　　-> @updates[] = new-1のデータ
-> new-2 -> link2 -> matchしたらoldの2とlinkが一緒だ！ -> これは新しくない
-> new-3 -> ...
-> new-last -> ...

@updates(配列)
1: new-1のデータ
2: new-5のデータ


@updatesがいい感じに配列になってる->View側では@updates.eachで頑張る





if 今日の画像カラム か link_urlカラム の値が
    old_crawl の画像 or リンクカラムと一致しないなら(muchメソッド)
    
    データベースの中のbrands配列と比較。一致するならnew_oneとする
    
    @update = new_one
