require 'rails_helper'

feature 'User edit company' do
  scenario 'successfully'do
    company_1 = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

     visit edit_company_path(company_1)

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

  scenario 'with valid data' do
    company_1 = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

     visit edit_company_path(company_1)

     fill_in 'Nome',      with: ''

     click_on 'Atualizar Empresa'

#     expect(page).to have_content 'Não foi possível atualizar a Empresa'
  end

end
