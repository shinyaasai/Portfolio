require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(
    user_name: "ケニー",
    email: "kennyisfat@example.com",
    password: "kennyisplaingbaseball",
  )
  
  it "ユーザーネーム、メール、パスワードがあれば有効な状態であること" do
    user = User.new(
      user_name: "ボブソン",
      email: "bobishandsum@example.com",
      password: "bobisplaingsoccer",
    )
    expect(user).to be_valid
  end

  it "ユーザーネームがなければ無効な状態であること" do
    user = User.new(user_name: nil)
    user.valid?
    expect(user.errors[:user_name]).to include("を入力してください")
  end

  it "ユーザーネームが10文字以上であれば無効な状態であること" do
    user = User.new(user_name: "ホゲホゲホゲホゲホゲホゲ")
    user.valid?
    expect(user.errors[:user_name]).to include("は10文字以内で入力してください")
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "パスワードがなけれな無効な状態であること" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "重複したユーザーネームは無効な状態であること" do
    user = User.create(
      user_name: "ケニー",
      email: "kennyisfat@example.com",
      password: "kennyisplaingbaseball",
    )
    user.valid?
    expect(user.errors[:user_name]).to include("はすでに存在します")
  end

  it "重複したメールアドレスは無効な状態であること" do
    user = User.create(
      user_name: "ケニー",
      email: "kennyisfat@example.com",
      password: "caseyisplaingtennis",
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
