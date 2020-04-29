require 'rails_helper'

RSpec.describe "User_Statuses", type: :system do

  describe "全ユーザー共通のテスト" do
  let(:record) { create(:record) }
  let(:other_record) { create(:other_record) }

  before do
  visit root_path
  click_link "ログイン"
  fill_in "メールアドレス", with: record.user.email
  fill_in "パスワード", with: record.user.password
  click_button "ログイン"
  end

   it "ログイン後ログインしましたと表示されること" do
     expect(page).to have_content "ログインしました"
   end

   it "ヘッダーにログインユーザーの名前が表示されること" do
     expect(page).to have_content "#{record.user.user_name}"
     expect(page).not_to have_content "#{other_record.user.user_name}"
   end
  end

  describe "ユーザーに今週の睡眠記録があるテスト" do
    let(:record) { create(:record, sleep_time: Time.current - 7.hours) }
    let(:other_record) { create(:other_record) }

    context "平均睡眠時間が６時間以上の場合" do
      it "しっかり睡眠が取れていますと表示される" do
        visit root_path
        click_link "ログイン"
        fill_in "メールアドレス", with: record.user.email
        fill_in "パスワード", with: record.user.password
        click_button "ログイン"
        expect(page).to have_content "しっかり睡眠が取れています"
      end
    end

    context "平均睡眠時間が6時間未満の場合" do
      it "睡眠時間が少ないようですと表示されること" do
        visit root_path
        click_link "ログイン"
        fill_in "メールアドレス", with: other_record.user.email
        fill_in "パスワード", with: other_record.user.password
        click_button "ログイン"
        expect(page).to have_content "睡眠時間が短いようです"
      end
    end
  end

  describe "ユーザーに今週の睡眠記録がない場合のテスト" do
    let(:no_record_user) { create(:no_record_user) }

    before do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: no_record_user.email
    fill_in "パスワード", with: no_record_user.password
    click_button "ログイン"
    end

    it "記録がありませんと表示されること" do
      expect(page).to have_content "記録がありません"
    end
  end
end
