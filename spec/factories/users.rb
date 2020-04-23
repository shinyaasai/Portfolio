FactoryBot.define do
  factory :user do
    user_name "ボブ"
    email "bobishandsum@example.com"
    password "bobisplaingsoccer"
  end

  # factory :user do
  #   user_name "ナンシー"
  #   email "nancyiscute@example.com"
  #   password "nansyisplayingtennis"
  #   association :record, factory: :u
  # end
end
