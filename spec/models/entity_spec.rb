require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create!(name: 'Chris', email: 'test@gmail.com', password: '123456', password_confirmation: '123456')
    @group = Group.create!(name: 'Schooling', icon: 'https//splash.com', user_id: @user.id)
    @entity = Entity.new(name: 'Fees', amount: 10, user_id: @user.id, group_id: @group.id)
  end

  describe 'validations' do
    it 'Should be valid with the correct attributes' do
      @entity.save
      expect(@entity).to be_valid
    end

    it 'Shouldn\'t be valid with no name' do
      @entity.name = nil
      expect(@entity).to_not be_valid
    end
    it 'should initialise amount to 10' do
      @entity.save
      expect(@entity.amount).to eq(10)
    end
  end

  describe 'associations' do
    it 'Should belong to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it 'Shoul belong to the group' do
      assc = described_class.reflect_on_association(:group)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
