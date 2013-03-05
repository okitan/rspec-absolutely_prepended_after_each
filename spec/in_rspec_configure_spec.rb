require "spec_helper"

describe "rspec-absolutely_prepended_after_each" do
  it_behaves_like "returning rspec output" do
    let(:spec) do <<-SPEC
RSpec.configure do |config|
  config.prepend_absolutely_after_each do
    puts "RSpec::Configuration.prepend_absolutely_after_each"
  end
end

describe "absolutely prepended after each" do
  after(:each) { puts "after(:each)" }
  prepend_after(:each) { puts "pepend_after(:each)" }

  it "works" do
  end
end
      SPEC
    end

    let(:result) do <<-RESULT
RSpec::Configuration.prepend_absolutely_after_each
pepend_after(:each)
after(:each)
      RESULT
    end
  end
end
