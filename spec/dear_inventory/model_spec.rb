# typed: false
# frozen_string_literal: true

RSpec.describe DearInventory::Model do
  it "can not be directly instantiated" do
    expect { described_class.new }.to raise_error(RuntimeError)
  end

  context "when acting on a child class" do
    let(:associated_test_model) do
      Class.new(described_class)
    end

    let(:test_model) do
      Class.new(described_class)
    end

    before do
      test_model.fields(
        String: {
          name: :string,
          type: :String,
        },
        Hash: {
          name: :hash,
          type: :Hash,
          model: associated_test_model,
        },
        Array: {
          name: :array,
          type: :Array,
          model: associated_test_model,
        },
      )
    end

    it "accepts symbol keys" do
      parameters = { String: "string" }
      expect { test_model.new(parameters) }.not_to raise_error
    end
  end
end
