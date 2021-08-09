RSpec.describe App::AppLogger do
  let(:dummy_class) { Class.new { include App::AppLogger } }
  let(:dummy_instance) { dummy_class.new }

  describe '.logger' do
    subject { dummy_instance.logger }

    it { is_expected.to be_an_instance_of(Logger) }
  end
end
