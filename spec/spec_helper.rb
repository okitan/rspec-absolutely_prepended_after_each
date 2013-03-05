require "bundler/setup"

require "rspec/absolutely_prepended_after_each"

require "tempfile"

require "tapp"
require "pry"

TMP_ROOT = File.expand_path("../tmp", File.dirname(__FILE__))

# this example require spec and return to set
shared_examples "returning rspec output" do
  def rspec(file)
    %x(bundle exec rspec -fd #{file})
  end

  def common_configuration
    <<-SPEC
require "rspec/absolutely_prepended_after_each"

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
end
    SPEC
  end

  before(:each) do
    @file = Tempfile.open(%w[ tmp _spec.rb ], TMP_ROOT) do |fp|
      fp.print common_configuration
      fp.print spec

      fp.path
    end
  end

  it "works" do
    rspec(@file).should include(result)
  end
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
end
