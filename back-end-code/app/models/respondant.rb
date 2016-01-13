class Respondant < ActiveRecord::Base
  belongs_to :survey_result
  has_many :survey_responses, dependent: :destroy

  scope :submitted, -> { where('submitted_at <= ?', Time.now)}
end
