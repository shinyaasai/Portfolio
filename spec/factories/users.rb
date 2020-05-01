FactoryBot.define do
  factory :user do
    user_name "ボブソン"
    email "bobsonishandsum@example.com"
    password "bobsonisplaingsoccer"
  end

  factory :other_user, class: User do
    user_name "ナンシー"
    email "nansyiscute@example.com"
    password "nansyisplaingtennis"
  end

  factory :no_record_user, class: User do
    user_name "ジョン"
    email "jonisgood@example.com"
    password "jonisplaingbaseball"
  end
end
