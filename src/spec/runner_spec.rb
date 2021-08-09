RSpec.describe Runner do
  describe '.run' do
    subject { described_class.run(event: event, context: context) }

    let(:lambda_context_class) do
      Class.new do
        def function_name
          'test-function'
        end
      end
    end

    let(:executor_class) do
      Class.new do
        def initialize(event:, context:); end

        def execute; end
      end
    end

    let(:event) { {} }
    let(:context) { lambda_context_class.new }
    let(:result_value) { { status: 'success' } }

    before do
      stub_const(
        'App::ExecutorSelector::EXECUTORS',
        { 'test-function': executor_class },
      )
    end

    it { is_expected.to eq(result_value) }

    context 'when raise exception' do
      let(:executor_class) do
        Class.new do
          def initialize(event:, context:); end

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
