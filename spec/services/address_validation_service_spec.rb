require 'rails_helper'

describe AddressValidationService do
  describe 'validates that address information is valid' do
    describe 'valid' do
      before :each do
        @valid_avs = AddressValidationService.new(about_the_home: 'Nice',
                                        recommended_list_price: '100000000',
                                        update_client_enthusiasm: 'Excited',
                                        buyer_agent_commission: '$500',
                                        about_the_seller: 'Cool guy',
                                        credit_card_number: '347881974288396',
                                        date: {
                                          credit_card_expiration_month: '10',
                                          credit_card_expiration_year: '2018'
                                          })
      end

      it 'valid_input?' do
        expect(@valid_avs.valid_input?).to eq(true)
      end
      it 'recommended_list_price' do
        expect(@valid_avs.valid_list_price?).to eq(true)
      end
      it 'client enthusiasm' do
        expect(@valid_avs.valid_client_enthusiasm?).to eq(true)
      end
      it 'buyer agent commision' do
        expect(@valid_avs.valid_buyer_agent_commision?).to eq(true)
      end
      it 'about the seller' do
        expect(@valid_avs.valid_seller_info?).to eq(true)
      end
      it 'credit card number' do
        expect(@valid_avs.valid_credit_card?).to eq(true)
      end
      it 'credit_card_expiration_date' do
        expect(@valid_avs.valid_credit_card_expiration_date?).to eq(true)
      end
    end
    describe 'invalid' do
      before(:each) do
        @invalid_avs = AddressValidationService.new(about_the_home: nil,
                                        recommended_list_price: 'one thousand',
                                        update_client_enthusiasm: nil,
                                        buyer_agent_commission: 'five hundred',
                                        about_the_seller: nil,
                                        credit_card_number: '34788197428',
                                        date: {
                                          credit_card_expiration_month: nil,
                                          credit_card_expiration_year: nil
                                          })
      end
      it 'recommended_list_price' do
        expect(@invalid_avs.valid_list_price?).to eq(false)
      end
      it 'client enthusiasm' do
        expect(@invalid_avs.valid_client_enthusiasm?).to eq(false)
      end
      it 'buyer agent commision' do
        expect(@invalid_avs.valid_buyer_agent_commision?).to eq(false)
      end
      it 'about the seller' do
        expect(@invalid_avs.valid_seller_info?).to eq(false)
      end
      it 'credit_card_number' do
        expect(@invalid_avs.valid_credit_card?).to eq(false)
      end
      it 'credit_card_expiration_date' do
        expect(@invalid_avs.valid_credit_card_expiration_date?).to eq(false)
      end
      it 'valid_input' do
        expect(@invalid_avs.valid_input?).to eq(false)
      end
    end
  end
end
