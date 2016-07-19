require 'rails_helper'

feature 'User edit company' do
  scenario 'successfully'do
    company = create :company

     visit edit_company_path(company)

     fill_in 'Nome',      with: 'Code Campus'
     fill_in 'Local',     with: 'RJ'
     fill_in 'Email',     with: 'campus@contato.com.br'
     fill_in 'Telefone',  with: '2369-1476'

     click_on 'Atualizar Empresa'

     expect(page).to have_css('h1', text: 'Code Campus')
     expect(page).to have_content 'RJ'
     expect(page).to have_content 'campus@contato.com.br'
     expect(page).to have_content '2369-1476'
  end


end
