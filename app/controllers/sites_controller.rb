class SitesController < ApplicationController
  
  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to  root_path
    end
  end
  


  def nokogiri
    sites = Site.all # <- 配列で返ってくる！
    puts sites
  end




  private
  
  def site_params
    params.require(:site).permit(:name, :url, :crawl)
  end

end


