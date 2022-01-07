class List < ApplicationRecord
  has_one_attached :image
  
  # validates :カラム で対象を指定し
  # presence :true　で存在をチェックする,trueを記述するとデータが存在しなければならないという設定になる
  validates :title, presence: true
  validates :body, presence: true
  # validates :image, presence: true
  
end
