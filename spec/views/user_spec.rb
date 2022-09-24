require 'rails_helper'

RSpec.describe 'users/index', type: :system do
  it 'should get splash on root' do
    visit root_path
    expect(page).to have_content('BudgetApp')
    expect(page).to have_content('Outrageously simple payment!..')
  end
end
