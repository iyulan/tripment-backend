# frozen_string_literal: true

module Api
  class ProceduresController < ApplicationController
    def search
      procedures = Procedures::SearchService.new(query: params[:query]).call

      render(json: procedures)
    end
  end
end
