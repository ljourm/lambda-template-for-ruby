RSpec.describe Runner do
  describe '#logger' do
    subject { described_class.logger }

    it { is_expected.to be_an_instance_of(Logger) }
  end

  describe '#run' do
    subject { described_class.run(executor: executor, event: event, context: context) }

    let(:executor) { App::Executor }
    let(:event) { {} }
    let(:context) { {} }

    let(:result_value) { { status: 'success' } }

    it { is_expected.to eq(result_value) }

    context 'when raise exception' do
      let(:executor) do
        Class.new do
          def initialize(**options); end

          def execute
            raise
          end
        end
      end
      let(:result_value) { { status: 'failure' } }

      it { is_expected.to eq(result_value) }
    end
  end
end
