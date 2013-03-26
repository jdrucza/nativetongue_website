class EnquiryObserver < ActiveRecord::Observer
  def after_create(enquiry)
    EnquiriesMailer.received(enquiry).deliver
  end
end
