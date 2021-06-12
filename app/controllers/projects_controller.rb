class ProjectsController < ApplicationController
  before_action :is_login?, except: [:show, :search]
  before_action :get_project, only: [:show]

  def show
    @due_date = @project.due_date
    @project_supports = @project.project_supports
    @percentage = (@project.percentage_of_reaching_goal * 100).round(2)
  end

  def owner
    @project_owner = current_user.project_owner
  end

  def owner_update
    @project_owner = current_user.project_owner
    @project_owner.update(project_owner_permit)

    redirect_to action: :owner
  end

  def search
    @key_words = params[:keyWord]
    if @key_words
      word = "%#{@key_words}%"
      @projects = Project.eager_load(:user).is_now_on_sale.where("projects.name LIKE ? or brief LIKE ? or users.name Like ?",word, word, word)
    else
      @projects = []
    end
  end

  private

  def get_project
    @project = Project.is_now_on_sale.find_by_id(params[:id])

    unless @project
      flash[:alert] = "沒有這個募資專案"
      redirect_to root_path
    end
  end

  def is_login?
    unless  current_user
      flash[:error] = "您尚未登入"
      redirect_to user_session_path
      return
    end
  end

  def project_owner_permit
    params.require(:project_owner).permit([:description, :cover_image])
  end

end
