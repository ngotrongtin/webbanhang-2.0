class StaticPageController < ApplicationController
  def home_page
    @pds = Product.all 
  end

  def contact
  end
end
