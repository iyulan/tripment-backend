# frozen_string_literal: true

class ProcedureSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :updated_at
end
