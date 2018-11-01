require 'rails_helper'

describe Address do
  context 'instance_methods' do
    it '#name' do
      address = Address.new('1860_south_marion_street-Denver-CO-80210')

      expect(address.name).to eq('1860 South Marion Street Denver Co 80210')
    end
    it '#value' do
      address = Address.new('1860_south_marion_street-Denver-CO-80210')

      expect(address.value).to eq('1860_south_marion_street-Denver-CO-80210')
    end
  end
end
