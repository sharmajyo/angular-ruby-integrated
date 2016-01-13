class SurveyResponse < ActiveRecord::Base
  belongs_to :respondant
  belongs_to :question

  scope :submitted, ->{ where.not(response_content: '') }
end
