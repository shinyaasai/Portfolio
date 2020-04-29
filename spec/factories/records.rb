FactoryBot.define do
  factory :record do
    getup_time Time.current
    sleep_time Time.current
    medicine "飲んだ"
    awakening "起きた"
    getout "１０分"
    sun "浴びた"
    sleepiness "元気に過ごせた"
    memo "HelloWorld"
    association :user, factory: :user
  end

  factory :other_record, class:Record do
    getup_time Time.current
    sleep_time Time.current
    medicine "飲んだ"
    awakening "起きた"
    getout "１０分"
    sun "浴びた"
    sleepiness "元気に過ごせた"
    memo "テスト"
    association :user, factory: :other_user
  end
end
