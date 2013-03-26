class EnquiriesController < ApplicationController
  respond_to :json, :html

  def create
    @enquiry = Enquiry.create!(name: params[:name], email: params[:email], content: params[:content])
    respond_with(@enquiry)
  end

  def index
    respond_with(@enquiries = Enquiry.all)
  end
end
