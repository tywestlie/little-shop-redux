RSpec.describe 'A user visits merchants dashboard' do
  xit 'shows a headline' do
    page_content = 'Merchants Dashboard'
    Merchant.create(name: 'borks r us')

    visit '/merchants-dashboard'

    expect(page).to have_content(page_content)
  end

  xit 'shows merchant with most items' do
    merchant1 = Merchant.create(name: 'borks r us')
    merchant2 = Merchant.create(name: 'gorks is you')
    Item.create(name: 'bork', description: 'totally borked it', unit_price: 666, merchant_id: merchant1.id, image: 'borkface.jpeg')
    Item.create(name: 'gork', description: 'totally gorked it', unit_price: 666, merchant_id: merchant2.id, image: 'gorkface.jpeg')
    Item.create(name: 'pork', description: 'totally porked it', unit_price: 666, merchant_id: merchant2.id, image: 'porkface.jpeg')
    page_content = "#{merchant2.name}"

    visit '/merchants-dashboard'

    within do
      expect(page).to have_content(page_content)
    end
  end
end
