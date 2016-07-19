require 'rails_helper'

feature 'Visitor view jobs by company' do
  scenario 'successfully' do

    category_ux = Category.create(name: 'UX')

    job = create :job

    another_job = Job.create(title: 'UX Senior',
                             location: 'São Paulo',
                             company: job.company,
                             category: category_ux,
                             description: 'UX com experiência em redes sociais')

    visit root_path

    click_on job.company.name

    expect(page).to have_css('h1', text: job.company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.category.name)

    expect(page).to have_content(another_job.title)
    expect(page).to have_content(category_ux.name)
  end

  scenario 'and view only the company jobs' do
    job = create :job


    another_company = Company.create(name: 'Google',
                                     location: 'São Paulo',
                                     mail: 'google@gmail.com.br',
                                     phone: '4444-8888')
    visit root_path

    click_on another_company.name

    expect(page).to have_css('h1', text: another_company.name)
    expect(page).not_to have_content(job.title)
    expect(page).not_to have_content(job.category.name)
  end


  scenario 'view a friendly message' do
    company = create :company

    visit root_path

    click_on company.name

    expect(page).to have_content 'Nenhuma vaga disponível'
  end
end
