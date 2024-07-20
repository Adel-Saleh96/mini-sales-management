class PagesController < ApplicationController
  def home
    redirect_to invoices_path if user_signed_in?
  end

  def about
  end
end
