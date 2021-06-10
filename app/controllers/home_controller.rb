class HomeController < ApplicationController

  def index
    @projects = Project.is_now_on_sale

  end
end
