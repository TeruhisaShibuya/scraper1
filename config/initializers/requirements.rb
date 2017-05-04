Dir[Rails.root.join("app/models/*.rb")].sort.each { |f| require f }
Dir[Rails.root.join("app/*.rb")].sort.each { |f| require f }