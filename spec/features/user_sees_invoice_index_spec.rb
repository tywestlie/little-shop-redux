# invoice index tests
RSpec.describe 'A user visits invoices page' do
  it 'shows a headline of invoices' do
    visit '/invoices'

    expect(page).to have_content('Invoices')
  end

  it 'shows a list of invoice names' do
    invoice = Invoice.create(customer_id: 1, merchant_id: 3434, status: 'shipped')

    visit '/invoices'

    expect(page).to have_content(invoice.id)
  end

  it 'can direct to edit invoice page' do
    Invoice.create(customer_id: 1, merchant_id: 3434, status: 'shipped')
    visit '/invoices'

    click_link('Edit')
    expect(current_path).to eq('/invoices/1/edit')
  end
  #
  # it 'can delete a merchant' do
  #   Merchant.create(name: 'Cole')
  #   visit '/merchants'
  #
  #   click_button('Delete')
  #   expect(page).to_not have_content('Cole')
  #   expect(Merchant.count).to eq(0)
  # end
  #
  # it 'can view one merchant' do
  #   merchant = Merchant.create(name: 'Manoj')
  #   visit '/merchants'
  #
  #   click_link(merchant.name)
  #   expect(current_path).to eq("/merchants/#{merchant.id}")
  # end
end