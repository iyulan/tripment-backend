# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Procedures::SearchService) do
  describe "#call" do
    let(:query) { "#{Faker::Lorem.unique.word}$$" }
    let!(:procedure_1) { create(:procedure, name: "#{Faker::Lorem.unique.word}#{query}#{Faker::Lorem.unique.word}") }
    let!(:procedure_2) { create(:procedure, name: "#{query.upcase}#{Faker::Lorem.unique.word}") }

    subject { described_class.new(query: query).call }

    before { create_list(:procedure, 3) }

    it "should return 2 procedure with name like query" do
      expect(subject).to(eq([procedure_2, procedure_1]))
    end
  end
end
