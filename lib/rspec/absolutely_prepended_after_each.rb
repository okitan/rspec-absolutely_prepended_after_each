require "rspec"

module RSpec::AbsolutelyPrependedAfterEach
  def prepend_absolutely_after_each(*args, &block)
    around(:each, *args) do |ex|
      example_group = example.example_group

      # if not after(:each) is called multiple times
      unless example_group.metadata[:absolutely_prepended_after_each]
        example_group.before(:each, *args, &block)

        example_group.metadata[:absolutely_prepended_after_each] = true
      end

      ex.run
    end
  end
end

module RSpec::Core
  class ExampleGroup
    extend ::RSpec::AbsolutelyPrependedAfterEach
  end

  class Configuration
    include ::RSpec::AbsolutelyPrependedAfterEach
  end
end
