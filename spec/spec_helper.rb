# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'factory_bot_rails'
require 'json_matchers/rspec'
require 'webmock/rspec'
require 'vcr'

FactoryBot.factories.clear
FactoryBot.reload

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  def set_graphql_type
    self.let(:subject) do
      self.described_class
    end
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.order = :random
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FactoryBot::Syntax::Methods

  config.before :each do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
    ActionMailer::Base.deliveries.clear
  end

  config.after do
    DatabaseCleaner.clean
  end

  JsonMatchers.schema_root = "spec/support/api/schemas"

  # Cassettes configuration
  VCR.configure do |c|
    # To route all requests for a particular URI to a particular cassette,
    # add to this hash. The key
    # should be a regex matching the URI.
    # The value should be an array of arguments to VCR.use_cassette,
    # so the first element should be the name of the cassette and
    # an optional second element would be
    # any options to pass, e.g. matching rules.
    #
    URI_FILTERS = {
      %r{.*anapioficeandfire.com/api/books.*} =>
        ['books_response', { match_requests_on: %i[method host headers] }],
      %r{.*anapioficeandfire.com/api/characters.*} =>
        ['characters_response', { match_requests_on: %i[method host headers] }],
      %r{.*anapioficeandfire.com/api/houses.*} =>
        ['houses_response', { match_requests_on: %i[method host headers] }]
    }.freeze

    c.hook_into                  :webmock
    c.cassette_library_dir     = 'spec/cassettes'
    c.default_cassette_options = { record: :new_episodes }
    c.configure_rspec_metadata!
    c.around_http_request do |request|
      selected_config = nil
      URI_FILTERS.each do |pattern, conf|
        (selected_config = conf) && break if pattern.match(request.uri)
      end
      # If no match was found in the list of URI filters,
      # force the developer to fix that oversight.
      raise VCR::Errors::UnhandledHTTPRequestError.new(request) unless
      selected_config.present?
      VCR.use_cassette(*selected_config, &request)
      # Otherwise, use the cassette configuration determined by the URI match.
    end
  end
end
