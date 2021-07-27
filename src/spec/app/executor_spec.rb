RSpec.describe App::Executor do
  let(:executor) { described_class.new(event: event, context: context) }
  let(:event) { {} }
  let(:context) { {} }

  it '#execute' do
    expect { executor.execute }.not_to raise_exception
  end
end
