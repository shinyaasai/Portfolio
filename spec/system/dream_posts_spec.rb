require 'rails_helper'

RSpec.describe "Dream_posts" do
  let(:record) { create(:record) }

  before do
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: record.user.email
    fill_in "パスワード", with: record.user.password
    click_button "ログイン"
    visit record_path(record.id)
    click_on "投稿する"
  end
  context "コメントを投稿した場合" do

    it "投稿ボタンが投稿削除ボタンに切り替わる", js: true do
      expect(page).to have_link "投稿を取り消す"
    end
  end
  context "コメントを削除した場合" do

    it "投稿削除ボタンが投稿ボタンに切り替わる", js: true do
      click_on "投稿を取り消す"
      expect(page).to have_link "投稿する"
    end
  end
end
