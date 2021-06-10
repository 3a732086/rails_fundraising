class HomeController < ApplicationController

  def index
    @projects = Project.is_now_on_sale

    @categories = Category.is_published
  end
end
