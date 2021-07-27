RSpec.describe Runner do
  describe '#config' do
    subject { described_class.config }

    let(:expected_value) do
      {
        common_message: 'This is common message',
        env_message: 'This env is test.',
        log_level: 'FATAL',
      }
    end

    it { is_expected.to eq(expected_value) }
  end
end
