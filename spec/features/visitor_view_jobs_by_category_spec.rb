require 'rails_helper'

feature 'Visitor view jobs by category' do
  scenario 'successfully' do
    job = create :job

    another_job = Job.create(title: 'Dev Java Senior',
                             location: 'São Paulo',
                             company: job.company,
                             category: job.category,
                             description: 'Dev com experiência em Java 8')

    visit root_path

    click_on job.category.name

    expect(page).to have_css('h1', text: job.category.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(another_job.title)
  end

  scenario 'and view only the current category jobs' do
    job = create :job

    another_category = Category.create(name: 'Analista QA')

    another_job = Job.create(title: 'QA Java Senior',
                             location: 'São Paulo',
                             company: job.company,
                             category: another_category,
                             description: 'QA com experiência em Java 8')

    visit root_path

    click_on another_category.name

    expect(page).to have_css('h1', text: another_category.name)
    expect(page).to have_content another_job.title
    expect(page).to have_content another_job.location
    expect(page).not_to have_content job.title
  end

  scenario 'view a friendly empty message' do
    category = create :category

    visit root_path

    click_on category.name

    expect(page).to have_content 'Nenhuma vaga disponível'
  end
end
