class Record < ApplicationRecord
  belongs_to :user
  
  enum medicine:  { 飲んだ: 1, 飲んでいない: 2  }
  enum awakening: { 起きた: 1, 起きていない: 2 }
  enum getout: { １０分: 1, ２０分: 2, ３０分: 3,  ４０分: 4, ５０分: 5,
                 ６０分: 6, ６０分以上: 7,
                }
  enum sun: { 浴びた: 1, 浴びていない: 2 }
  enum sleepiness: { 元気に過ごせた: 1, 少し眠気があった: 2, １日中眠気があった: 3 }
  
  def self.search(search)
      if search
        Record.where(['created_at LIKE ?', "%#{search}%"])
      else
        Record.all
      end
  end
end
