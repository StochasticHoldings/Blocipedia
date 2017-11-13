require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let (:user) {User.create!(email:'bloc@bloc.io', password: 'pace123456')}
  let (:wiki) {Wiki.create!(title:"New Wiki Title", body:"New Body Title", private: false, user: user)}

  describe 'attributes' do
    it 'has title, body and private attributes' do
      expect(wiki).to have_attributes(title:"New Wiki Title", body:"New Body Title", private: false, user: user)
    end
  end
end
