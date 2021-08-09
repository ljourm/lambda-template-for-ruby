RSpec.describe App::Config do
  let(:dummy_class) { Class.new { include App::Config } }
  let(:dummy_instance) { dummy_class.new }

  describe '#config' do
    subject { dummy_instance.config }

    let(:expected_value) do
      {
        common_message: 'This is common message',
        env_message: 'This env is test.',
        log_level: 'FATAL',
        region: 'ap-northeast-1',
      }
    end

    it { is_expected.to eq(expected_value) }
  end
end
