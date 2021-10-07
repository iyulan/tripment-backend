# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Api::ProceduresController, type: :controller) do
  describe "GET #search" do
    before { create_list(:procedure, 3) }

    shared_examples "success response" do
      it "should be success" do
        expect(response.status).to(eq(200))
      end
    end

    context "when empty query" do
      before { get :search }

      it_behaves_like "success response"

      it "should return empty json" do
        expect(json_body).to(eq([]))
      end
    end

    context "when query present" do
      let(:query) { Faker::Lorem.unique.word }
      let!(:procedure_1) { create(:procedure, name: "#{Faker::Lorem.unique.word}#{query}#{Faker::Lorem.unique.word}") }
      let!(:procedure_2) { create(:procedure, name: "#{query.upcase}#{Faker::Lorem.unique.word}") }

      before { get :search, params: { query: query } }

      it_behaves_like "success response"

      it "should return valid json" do
        expect(json_body).to(match_response_schema("procedures"))
      end
    end
  end
end
