require 'rails_helper'

describe AddressValidationService do
  describe 'validates that address information is valid' do
    it 'credit card number' do
      avs = AddressValidationService.new(credit_card_number: "1234567891234567890")
      expect(avs.valid_credit_card?).to eq(true)
    end
  end
end
