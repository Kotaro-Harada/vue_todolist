class Task < ApplicationRecord
  # バリデーション
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validate :end_datetime_after_start_datetime

  private

  # カスタムバリデーション: 終了日時が開始日時より後かどうかを確認
  def end_datetime_after_start_datetime
    if start_datetime.present? && end_datetime.present? && end_datetime < start_datetime
      errors.add(:end_datetime, "must be after the start datetime")
    end
  end
end
