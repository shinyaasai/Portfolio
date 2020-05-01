require 'rails_helper'

RSpec.describe "Dreams" do
  let(:record) { create(:record) }
  let(:other_user_record) { create(:other_record)}

  before do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: record.user.email
    fill_in "パスワード", with: record.user.password
    click_button "ログイン"
    visit record_path(record.id)
  end
  context "投稿されていない夢の記録の場合" do

    it "夢の記録は表示されないこと" do
      visit dreams_path
      expect(page).not_to have_content "#{record.memo}"
    end
  end
  context "投稿された夢の記録がある場合" do
    before do
      click_on "投稿する"
      visit dreams_path
    end
    
    it "夢の記録が表示されること" do
      expect(page).to have_content "#{record.memo}"
    end

    it "投稿された記録に本人のユーザーネームが表示されていること" do
      expect(page).to have_content "#{record.user.user_name}"
      expect(page).not_to have_content "#{other_user_record.user.user_name}"
    end
  end
end
