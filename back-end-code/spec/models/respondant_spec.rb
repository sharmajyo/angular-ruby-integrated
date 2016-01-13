require 'rails_helper'

describe Respondant do
  describe 'scope #submitted' do
    let(:submitted_respondant) { FactoryGirl.create(:respondant, submitted_at: 1.day.ago) }
    let(:unsubmitted_respondant) { FactoryGirl.create(:respondant, submitted_at: nil) }

    subject(:submitted) { Respondant.submitted }

    it { is_expected.to eq [submitted_respondant] }
  end
end
