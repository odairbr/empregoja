require 'rails_helper'

feature 'User create category' do
  scenario 'successfuly' do
    category = Category.new(name: 'estágio')

    visit new_category_path

    fill_in 'Nome', with: category.name

    click_on 'Criar Categoria'

    expect(page).to have_css('h1', text: category.name)
  end

  scenario 'should fill all fields' do
    visit new_category_path

    click_on 'Criar Categoria'

    expect(page).to have_content 'Nome da categoria está em branco'

  end
end
