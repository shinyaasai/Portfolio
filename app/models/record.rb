class Record < ApplicationRecord
  require 'date'
  belongs_to :user
  has_one :dream_post, dependent: :destroy
  has_many :record_tag_relations, dependent: :destroy
  has_many :tags, through: :record_tag_relations
  has_many :comments, dependent: :destroy

  validates :getup_time, presence: true
  validates :sleep_time, presence: true
  validates :medicine,   presence: true
  validates :awakening,  presence: true
  validates :getout,     presence: true
  validates :sun,        presence: true
  validates :sleepiness, presence: true
  validate  :sleep_time_not_after_day
  validate  :getup_time_not_after_day

  enum medicine:  { 飲んだ: 1, 飲んでいない: 2  }
  enum awakening: { 起きた: 1, 起きていない: 2 }
  enum getout: { １０分: 1, ２０分: 2, ３０分: 3,  ４０分: 4, ５０分: 5,
    ６０分: 6, ６０分以上: 7,
  }
  enum sun: { 浴びた: 1, 浴びていない: 2 }
  enum sleepiness: { 元気に過ごせた: 1, 少し眠気があった: 2, １日中眠気があった: 3 }

  def self.search(search)
    if search
      Record.where(['getup_time LIKE ?', "%#{search}%"])
    else
      Record.all
    end
  end

  # 未来日入力のバリデーションメソッド
  def sleep_time_not_after_day
    errors.add(:sleep_time, "に未来日は選択できません") if sleep_time > Time.now
  end

  def getup_time_not_after_day
    errors.add(:getup_time, "に未来日は選択できません") if getup_time > Time.now
  end

  def dream_post_by(user)
    DreamPost.find_by(user_id: user.id, record_id: id)
  end

end
