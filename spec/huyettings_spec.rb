require 'spec_helper'

RSpec.describe Huyettings do
  let(:filepath) { File.expand_path(File.dirname(__FILE__) + '/fixture.yml') }

  subject { described_class.new(filepath, :test) }

  it 'extracts value as is if value is a string' do
    expect(subject.key_with_string).to eq 'key_with_string'
  end

  it 'evals code if value is embedded code' do
    expect(subject.key_with_code).to eq 3
  end

  it 'returns nothing when inexistent key' do
    expect(subject.foobar).to eq nil
  end

  it 'symbolizes keys' do
    expect(subject.nested[:key]).to eq 'key'
  end

  context 'when no config file given' do
    subject { described_class.new }

    it { expect { subject }.to raise_error ArgumentError }
  end
end
