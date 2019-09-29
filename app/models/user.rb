# frozen_string_literal: true

class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :service_provider, type: String
end
