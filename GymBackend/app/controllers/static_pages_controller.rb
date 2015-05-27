class StaticPagesController < ApplicationController
  before_action :check_if_logged, only: [:home]
  def home
  end

  def about
  end

  def contact
  end

  def help
  end
  def check_if_logged
    if(logged_in?)
      redirect_to current_user
    end
  end
end
