class StaticPageController < ApplicationController
  def home_page
    @pds = Product.all 
  end

  def not_found 
  end

  def contact
  end
end
