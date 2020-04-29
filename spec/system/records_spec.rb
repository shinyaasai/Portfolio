require 'rails_helper'

RSpec.describe "Records", type: :system do

  it "ユーザーは新しく記録を入力することができる" do
    user = create(:user)
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect {
      find(".fa-edit").click
      expect(page).to have_content '寝た時のこと'
      select "1", from: 'record[sleep_time(2i)]'
      select "1", from: 'record[sleep_time(3i)]'
      select "11", from: 'record[sleep_time(4i)]'
      select "11", from: 'record[sleep_time(5i)]'
      select '飲んだ', from: '寝るための薬は飲みましたか？'
      select '起きた', from: '途中で目が覚めた?'
      click_button "次へ"

      expect(page).to have_content "朝のこと"
      select "1", from: 'record[getup_time(2i)]'
      select "1", from: 'record[getup_time(3i)]'
      select "11", from: 'record[getup_time(4i)]'
      select "11", from: 'record[getup_time(5i)]'
      select '１０分', from: 'どのくらいで布団から出た？'
      select '浴びた', from: '朝日を浴びた？'
      click_button "次へ"

      expect(page).to have_content "昼のこと"
      select '元気に過ごせた', from: '元気に過ごせた？'
      click_button "次へ"

      expect(page).to have_content "夢日記"
      fill_in '夢を記録しよう', with: 'テスト'
      click_button "登録"
    }.to change(user.records, :count).by(1)
    expect(page).to have_content '登録しました'
  end

  describe "睡眠記録一覧ページ" do
    let(:record) { create(:record) }

    before do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: record.user.email
      fill_in "パスワード", with: record.user.password
      click_button "ログイン"
    end

    it "ページが正しく表示される" do
      expect(current_path).to have_content "睡眠記録"
    end

    it "footerが正しく表示される" do
      within ".footer"
      expect(page).to have_content "みんなが投稿した夢の記録をみてみよう！"
    end

    it "登録した日付が表示される" do
      expect(page).to have_content "#{record.sleep_time.to_s(:date_jp)}〜\n#{record.getup_time.to_s(:date_jp)}"
    end

    it "平均睡眠時間が表示される" do
      expect(page).to have_content (( record.getup_time -  record.sleep_time) / 3600).to_f.floor(1)
    end

    it "削除ボタンを押すと記録が削除される" do
      pending 'あとで直す'
      click_link ("削除")
      expect(page).to have_content "削除しました"
    end
  end


  describe "睡眠記録の詳細ページ" do
    let!(:record) { create(:record) }

    before do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: record.user.email
      fill_in "パスワード", with: record.user.password
      click_button "ログイン"
      click_link ("詳細")
    end

    it "footerに一覧ページのみで表示するものは表示されないこと" do
      within ".footer"
      expect(page).not_to have_content "みんなが投稿した夢の記録をみてみよう！"
    end

    it "ページが正しく表示される" do
      expect(page).to have_content 'の記録'
      expect(page).to have_content record.getup_time.to_s(:datetime_jp)
      expect(page).to have_content record.sleep_time.to_s(:datetime_jp)
      expect(page).to have_content record.medicine
      expect(page).to have_content record.awakening
      expect(page).to have_content record.getout
      expect(page).to have_content record.sun
      expect(page).to have_content record.memo
    end

    it "編集ボタンから更新をすることができる" do
      click_on "編集"
      expect(page).to have_content "の記録"
      select "2", from: 'record[sleep_time(2i)]'
      select "2", from: 'record[sleep_time(3i)]'
      select "22", from: 'record[sleep_time(4i)]'
      select "22", from: 'record[sleep_time(5i)]'
      select '飲んだ', from: 'record[medicine]'
      select '起きた', from: 'record[awakening]'
      select "2", from: 'record[getup_time(2i)]'
      select "2", from: 'record[getup_time(3i)]'
      select "22", from: 'record[getup_time(4i)]'
      select "22", from: 'record[getup_time(5i)]'
      select '２０分', from: 'record[getout]'
      select '浴びていない', from: 'record[sun]'
      select '少し眠気があった', from: 'record[sleepiness]'
      fill_in 'record[memo]', with: 'Hello!'
      click_button "更新"
      expect(page).to have_content "更新しました"
    end
  end
end
