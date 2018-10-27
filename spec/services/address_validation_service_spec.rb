require 'rails_helper'

describe AddressValidationService do
  before :each do
    @valid_avs = AddressValidationService.new(about_the_home: "Nice",
                                        recommended_list_price: "100000000",
                                        update_client_enthusiasm: "Excited",
                                        buyer_agent_commission: "$500",
                                        about_the_seller: "Cool guy",
                                        credit_card_number: "347881974288396",
                                        credit_card_expiration_date: "2020-10"
                                        )
    @invalid_avs = AddressValidationService.new(about_the_home: nil,
                                        recommended_list_price: "one thousand",
                                        update_client_enthusiasm: nil,
                                        buyer_agent_commission: "five hundred",
                                        about_the_seller: "74",
                                        credit_card_number: "34788197428",
                                        credit_card_expiration_date: "1990-10"
                                        )
  end
  describe 'validates that address information is valid' do
    describe 'valid' do
      it 'credit card number' do
        expect(@valid_avs.valid_credit_card?).to eq(true)
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
    end
    describe 'invalid' do
      it 'credit_card_number' do
        expect(@invalid_avs.valid_credit_card?).to eq(false)
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
    end
  end
end
