class Question < ActiveRecord::Base
  belongs_to :theme
  delegate :survey_result, to: :theme
  has_many :survey_responses
end
