require "spec_helper"

describe EnquiriesMailer do
  describe "confirmation" do
    let(:mail) { EnquiriesMailer.confirmation }

    it "renders the headers" do
      mail.subject.should eq("Confirmation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "received" do
    let(:mail) { EnquiriesMailer.received }

    it "renders the headers" do
      mail.subject.should eq("Received")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
