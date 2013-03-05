require "spec_helper"

describe "rspec-absolutely_prepended_after_each" do
  it_behaves_like "returning rspec output" do
    let(:spec) do <<-SPEC
describe "absolutely prepended after each" do
  prepend_absolutely_after_each { puts "prepend_absolutely_after_each" }
  after(:each)                  { puts "after(:each)" }
  prepend_after(:each)          { puts "pepend_after(:each)" }

  it "works" do
  end
end
      SPEC
    end

    let(:result) do <<-RESULT
prepend_absolutely_after_each
pepend_after(:each)
after(:each)
      RESULT
    end
  end
end
