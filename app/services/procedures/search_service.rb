# frozen_string_literal: true

module Procedures
  class SearchService
    def initialize(procedures: nil, query:)
      @procedures ||= Procedure.all
      @query = query
    end

    def call
      return [] unless query

      find_by_name
    end

    private

    attr_reader :procedures, :query

    def find_by_name
      @procedures.where("LOWER(name) LIKE ?", "%#{query.downcase}%")
        .select("procedures.*, CASE WHEN LOWER(name) LIKE '#{query.downcase}%' THEN 1 ELSE 2 END AS rank")
        .order(:rank)
    end
  end
end
