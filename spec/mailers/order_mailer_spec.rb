require 'rails_helper'

RSpec.describe OrderMailer, type: :mailer do
  describe 'order_confirmation' do
    let(:order) { create(:order) } # предполагается, что у вас есть фабрика для создания заказа

    it 'renders the headers' do
      mail = OrderMailer.order_confirmation(order)
      expect(mail.subject).to eq('Order Confirmation')
      expect(mail.to).to eq([order.email])
      expect(mail.from).to eq(['gritskevich.vladimir@gmail.com'])
    end

    it 'renders the body' do
      mail = OrderMailer.order_confirmation(order)
      expect(mail.body.encoded).to match('Dear')
      expect(mail.body.encoded).to match(order.customer_name)
      expect(mail.body.encoded).to match(order.id.to_s)
    end
  end
end
