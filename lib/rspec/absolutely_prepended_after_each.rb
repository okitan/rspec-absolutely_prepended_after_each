require "rspec"

module Rspec::AbsolutelyPrependedAfterEach
  def absolutely_prepended_after_each_flag_key
    :absolutely_prepended_after_each
  end

  def prepend_absolutely_after_each(*args, &block)
    around(:each, *args) do |ex|
      exmple_group = example.example_group

      # if not after(:each) is called multiple times
      unless example_group.metadata[absolutely_prepended_after_each_flag_key]
        example_group.before(:each, *args, &block)

        example_group.metadata[absolutely_prepended_after_each_flag_key] = true
      end

      ex.run
    end
  end
end

module RSpec::Core::Hooks
  class Hook
    include ::RSpec::AbsolutelyPrependedAfterEach
  end
end
