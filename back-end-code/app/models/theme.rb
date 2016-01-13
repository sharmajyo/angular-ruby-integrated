class Theme < ActiveRecord::Base
  belongs_to :survey_result
  has_many :questions, dependent: :destroy
end
