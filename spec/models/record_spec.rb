require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @user = User.create(
    user_name: "ボブ",
    email: "bobishandsum@example.com",
    password: "bobisplaingsoccer",
    )
  end
   
  it "ユーザー本人であれば起床時間、就寝時間、薬、目覚め、布団から出る、朝日、眠気を登録できること"  do
   record = Record.new(
      user_id: @user.id,
      getup_time: Time.current,
      sleep_time: Time.current,
      medicine: "飲んだ",
      awakening: "起きた",
      getout: "１０分",
      sun: "浴びた",
      sleepiness: "元気に過ごせた"
      )
    expect(record).to be_valid  
  end
end
