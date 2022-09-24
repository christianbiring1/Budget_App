require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create!(name: 'Chris', email: 'test@gmail.com', password: '123456', password_confirmation: '123456')
    @group = Group.new(name: 'Group 1', icon: 'https//splash.com', user_id: @user.id)
  end
  describe 'validations' do
    it 'Should be valid with correct attributes' do
      @group.save
      expect(@group).to be_valid
    end
    it 'Shouldn\'t be valid with no a name' do
      expect(Group.new).to_not be_valid
    end
  end

  describe 'associations' do
    it 'Must have many entities' do
      assc = described_class.reflect_on_association(:entities)
      expect(assc.macro).to eq :has_many
    end
    it 'Must belong to a user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
