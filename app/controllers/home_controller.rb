# Controller class for the Home Page that will have functions for all the nav items. 
class HomeController < ApplicationController

  def index
  end

  def table
  end

  def match
  end

  def contact
  end

  # function that will be triggered when user submits the for from contact us
  def send_email
      begin
        ContactMailer.contact_email(params[:name], params[:email], params[:subject], params[:message]).deliver_now
      rescue => e
      end
      redirect_to contact_us_url, notice: "We have received your contact request."
  end

end
