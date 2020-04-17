require 'rails_helper'

RSpec.describe "Records", type: :system do

  it "ユーザーは新しく記録を入力する" do
    user = create(:user)
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect {
      click_link "記録する"
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

  describe "睡眠記録の詳細ページを" do
    before do
      user = create(:user)
      @record = user.records.create(
        getup_time: Time.current,
        sleep_time: Time.current,
        medicine: "飲んだ",
        awakening: "起きた",
        getout: "１０分",
        sun: "浴びた",
        sleepiness: "元気に過ごせた",
        memo: "テスト"
      )
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログイン"
      click_link "詳細"
    end

    it "ページが正しく表示される" do
      expect(page).to have_content 'の記録'
      expect(page).to have_content @record.getup_time.to_s(:datetime_jp)
      expect(page).to have_content @record.sleep_time.to_s(:datetime_jp)
      expect(page).to have_content @record.medicine
      expect(page).to have_content @record.awakening
      expect(page).to have_content @record.getout
      expect(page).to have_content @record.sun
      expect(page).to have_content @record.memo
    end
  end
end
