require "rails_helper"

RSpec.describe OrderNotifier, type: :mailer do
  before do
    @order = create(:order)
    @line_item = create(:line_item, order: @order)
  end

  let(:from) { "depot@example.com" }

  describe "received" do
    let(:mail) { OrderNotifier.received(@order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Pragmatic Store Order Confirmation")
      expect(mail.to).to eq([@order.email])
      expect(mail.from).to eq([from])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("1 x #{@line_item.product.title[0, 40]}")
    end
  end

  describe "shipped" do
    let(:mail) { OrderNotifier.shipped(@order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Pragmatic Store Order Shipped")
      expect(mail.to).to eq([@order.email])
      expect(mail.from).to eq([from])
    end

    it "renders the body" do
      # expect(mail.body.encoded).to match("<td>1 &times;</td>")
    end
  end
end
