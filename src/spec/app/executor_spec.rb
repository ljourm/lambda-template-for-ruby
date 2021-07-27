RSpec.describe App::Executor do
  let(:executor) { described_class.new(config: config, event: event, context: context) }
  let(:config) { {} }
  let(:event) { {} }
  let(:context) { {} }

  it '#execute' do
    expect { executor.execute }.not_to raise_exception
  end
end
