class Record < ApplicationRecord
  enum sun: { yes: 0, no: 1 }
  enum medicine: { 飲んだ: 0, 飲まなかった: 1 }
  enum awakening: { good: 0, normal: 1, bad: 2 }  
  
  def self.search(search)
      if search
        Record.where(['created_at LIKE ?', "%#{search}%"])
      else
        Record.all
      end
    end
end
