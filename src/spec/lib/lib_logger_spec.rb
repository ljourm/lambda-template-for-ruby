RSpec.describe Lib do
  describe '.logger' do
    subject { described_class.logger }

    it { is_expected.to be_an_instance_of(Logger) }
  end
end
