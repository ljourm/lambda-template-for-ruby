RSpec.describe 'Utility' do
  describe '.transform_keys_to_sym' do
    subject { Utility.transform_keys_to_sym(arg) }

    let(:arg) do
      {
        'array' => [
          1,
          {
            'hash' => {
              'array' => [2, 'foo'],
              'hash' => 'bar',
            },
          },
        ],
        'hash' => { 'a' => 'a', 'b' => 'b' },
        'string' => 'str',
      }
    end

    let(:result) do
      {
        array: [
          1,
          {
            hash: {
              array: [2, 'foo'],
              hash: 'bar',
            },
          },
        ],
        hash: { a: 'a', b: 'b' },
        string: 'str',
      }
    end

    it { is_expected.to eq result }
  end
end
