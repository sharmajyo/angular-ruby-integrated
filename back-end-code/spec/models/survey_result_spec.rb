require 'rails_helper'

describe SurveyResult do
  describe '#find_question' do
    let!(:survey_result) { FactoryGirl.create(:survey_result_with_question) }
    let!(:question) { survey_result.questions.first }
    let(:question_description) { question.description }

    context 'question exists for the survey result' do
      subject(:result) { survey_result.find_question(question_description) }

      it { is_expected.to eq question }
    end

    context 'question exists for another survey result' do
      let(:other_question_description) { other_survey_result.questions.first.description }
      let!(:other_survey_result) { FactoryGirl.create(:survey_result_with_question) }

      subject(:result) { survey_result.find_question(other_question_description) }

      it { is_expected.to be_nil }
    end

    context 'question does not exist at all' do
      subject(:result) { survey_result.find_question('notthere') }

      it { is_expected.to be_nil }
    end
  end

  describe '#participant_count' do
    let(:survey_result) do
      FactoryGirl.create(:survey_result) do |survey_result|
        FactoryGirl.create(:respondant, survey_result: survey_result)
        FactoryGirl.create(:respondant, survey_result: survey_result)
        FactoryGirl.create(:respondant, survey_result: survey_result)
      end
    end

    subject(:participant_count) { survey_result.participant_count }

    it { is_expected.to eq 3 }
  end

  describe '#response_rate' do
    subject(:response_rate) { survey_result.response_rate }

    context 'all participants completed the survey' do
      let(:survey_result) do
        FactoryGirl.create(:survey_result) do |survey_result|
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: 1.day.ago)
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: 1.day.ago)
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: 1.day.ago)
        end
      end

      it { is_expected.to eq 1 }
    end

    context 'no participants completed the survey' do
      let(:survey_result) do
        FactoryGirl.create(:survey_result) do |survey_result|
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: nil)
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: nil)
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: nil)
        end
      end

      it { is_expected.to eq 0 }
    end

    context 'some participants completed the survey' do
      let(:survey_result) do
        FactoryGirl.create(:survey_result) do |survey_result|
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: 1.day.ago)
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: 2.days.ago)
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: nil)
          FactoryGirl.create(:respondant, survey_result: survey_result, submitted_at: nil)
        end
      end

      it { is_expected.to eq 0.5 }
    end

    context 'no participants' do
      let(:survey_result) { FactoryGirl.create(:survey_result) }

      it { is_expected.to eq 0 }
    end
  end
end
