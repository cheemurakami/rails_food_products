class ApplicationController < ActionController::Base
  helper_method :is_admin?

  def is_admin?
    current_user && current_user.admin
  end

  def authorized_admin?
    redirect_to products_path unless is_admin?
  end

end
