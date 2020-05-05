require 'rails_helper'

RSpec.describe Record, type: :model do
  context "ユーザーがログインしている時" do
    it "起床時間、就寝時間、薬、目覚め、布団から出る、朝日、眠気を登録できること" do
      expect(create(:record)).to be_valid
    end
  end

  context "ユーザーがログインしていない時" do
    it "起床時間、就寝時間、薬、目覚め、布団から出る、朝日、眠気を登録できないこと" do
      record = Record.create(
        getup_time: Time.current,
        sleep_time: Time.current,
        medicine: "飲んだ",
        awakening: "起きた",
        getout: "１０分",
        sun: "浴びた",
        sleepiness: "元気に過ごせた",
      )
      expect(record).not_to be_valid
    end
  end

  it "目覚めの項目を入力しなければ登録ができないこと" do
    record = build(:record, sleepiness: nil)
    record.valid?
    expect(record.errors[:sleepiness]).to include("を入力してください")
  end

  it "朝日を浴びましたか？の項目を入力しなければ登録ができないこと" do
    record = build(:record, sun: nil)
    record.valid?
    expect(record.errors[:sun]).to include("を入力してください")
  end

  it "どのくらいで布団から出た？の項目を入力しなければ登録ができないこと" do
    record = build(:record, getout: nil)
    record.valid?
    expect(record.errors[:getout]).to include("を入力してください")
  end

  it "日中の気分の項目を入力しなければ登録ができないこと" do
    record = build(:record, awakening: nil)
    record.valid?
    expect(record.errors[:awakening]).to include("を入力してください")
  end

  it "薬の項目を入力しなければ登録ができないこと" do
    record = build(:record, medicine: nil)
    record.valid?
    expect(record.errors[:medicine]).to include("を入力してください")
  end

  it "起床時間に未来日は選択できないこと" do
    record = build(:record, getup_time: Time.current + 1,)
    record.valid?
    expect(record.errors[:getup_time]).to include("に未来日は選択できません")
  end

  it "就寝時間に未来日は選択できないこと" do
    record = build(:record, sleep_time: Time.current + 1,)
    record.valid?
    expect(record.errors[:sleep_time]).to include("に未来日は選択できません")
  end

  it "夢の記録は空でも投稿ができること" do
    record = build(:record, memo: "")
    expect(record).to be_valid
  end
end
