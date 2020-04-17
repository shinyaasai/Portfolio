FactoryBot.define do
  factory :record do
    getup_time Time.current
    sleep_time Time.current
    medicine "飲んだ"
    awakening "起きた"
    getout "１０分"
    sun "浴びた"
    sleepiness "元気に過ごせた"
    association :user, factory: :user
  end

  factory :record2 do
    getup_time Time.current
    sleep_time Time.current
    medicine "飲んだ"
    awakening "起きた"
    getout "１０分"
    sun "浴びた"
    sleepiness "元気に過ごせた"
    memo "テスト"
  end
end
