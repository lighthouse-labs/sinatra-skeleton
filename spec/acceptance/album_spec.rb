require_relative '../spec_helper'


describe 'Albums scenarios' do
  # the page seen by the user is the subject of the tests.
  # this makes it the implicit receiver in the one-liners: it { ... }
  subject { page }

  context 'viewing the index' do

    context 'when there are no albums' do
      # clean database ensures no albums already

      before { visit '/albums' }

      it { should_not have_selector('ul.albums li') }
    end

    context 'when there are albums' do
      before do
        3.times { Album.create!(title: Faker::Book.title) } # book? close enough
        visit '/albums'
      end

      it { should have_selector('ul.albums li', count: 3) }
    end

  end

  context 'creating an album' do
    before { visit '/albums/new' }

    context 'when I view the form' do
      it { should have_selector('form') } # basic test shows the action works
    end

    context 'when I submit the form with valid data' do
      let(:album_title) { Faker::Book.title }

      before do
        fill_in :title, with: album_title
        fill_in :record_label, with: Faker::Name.name
        fill_in :release_date, with: 1.year.ago
        click_button 'Create'
      end

      it 'should redirect to the index' do
        expect(page).to have_selector('h1', text: 'Albums')
        expect(page).to have_selector('ul.albums')
      end

      it 'should show the album in the list' do
        expect(page).to have_selector('ul.albums li', text: album_title)
      end
    end

    context 'when I submit the form without a title' do
      let(:album_record_label) { Faker::Name.name }

      before do
        fill_in :record_label, with: album_record_label
        click_button 'Create'
      end

      it 'should render the form again' do
        expect(page).to have_content('New Album')
        expect(page).to have_selector('form')
      end

      it { should have_selector('.errors', text: "Title can't be blank") }

      it 'should preserve the submitted form data' do
        expect(page).to have_field('record_label', with: album_record_label)
      end

      # to be clear, because page is the subject, this is the same as above,
      # but with a less descriptive message:
      # it { should have_field('record_label', with: album_record_label) }
    end

  end
end
