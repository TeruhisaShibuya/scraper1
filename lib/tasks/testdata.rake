namespace :testdata do
        desc "サンプルデータを作成する"
        task populate: :environment do
            #10個Itemsのデータを作成する
            10.times do |n|
                
            image_url = "image_url#{n}"
            
            image     = "image#{n}@example.co.jpeg"
            
            brand = "brand#{n}"
            
      Item.create!(image_url: image_url, image: image, brand: brand)
    end
  end
end
