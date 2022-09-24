require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create!(name: 'Chris', email: 'test@gmail.com', password: '123456', password_confirmation: '123456')
  end
  context 'validations' do
    it 'Should be valid the correct attributes' do
      @user.save
      expect(@user).to be_valid
    end
    it 'Shouldn\'t valid with no name' do
      @user.name = nil
      @user.save
      expect(@user).to_not be_valid
    end
  end
  context 'associations' do
    it 'Must have many entities' do
      assc = described_class.reflect_on_association(:entities)
      expect(assc.macro).to eq :has_many
    end
    it 'Must havemany groups' do
      assc = described_class.reflect_on_association(:groups)
      expect(assc.macro).to eq :has_many
    end
  end
end
