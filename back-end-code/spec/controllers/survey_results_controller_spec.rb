require 'rails_helper'

describe SurveyResultsController do
  describe '#index' do
    before do
      get :index
    end

    it 'returns an OK response' do
      expect(response.status).to eq 200
    end
  end

  describe '#show' do
    let(:survey_result) { FactoryGirl.create(:survey_result) }

    before do
      get :show, id: survey_result.id
    end

    it 'returns an OK response' do
      expect(response.status).to eq 200
    end

    it 'loads the survey_result' do
      expect(assigns[:survey_result]).to eq survey_result
    end
  end
end
