class PaymentsController < ApplicationController
  before_action is_login?, only: [:mpg]
  before_action :get_pledge, only: [:mpg]

  def mpg

  end

  def paid

  end

  def not_paid_yet

  end

  def canceled

  end

  def notify

  end

  private

  def is_login?
    unless current_user
      flash[:error] = "您尚未登入"
      redirect_to login_path
      return
    end
  end

  def get_pledge
    @pledge = Pledge.not_paid.find_by(id: params[:pledge_id], user: current_user)

    unless @pledge
      flash[:alert] = "沒有此贊助"
      redirect_to root_path
      return
    end
  end

end
