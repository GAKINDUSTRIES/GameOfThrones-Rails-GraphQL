module Filterable
  extend ActiveSupport::Concern

  included do
    scope :filter_by, ->(args) { args.present? ? where(args) : all }
  end
end
