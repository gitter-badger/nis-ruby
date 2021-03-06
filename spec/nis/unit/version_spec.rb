require 'spec_helper'

describe Nis::Unit::Version do
  let(:value){ 1744830465 }
  let(:version){ described_class.new(value) }
  let(:other){ described_class.new(value) }

  subject { version }

  describe '#mainnet?' do
    it { expect(subject.mainnet?).to eq true }

    context 'with testnet version' do
      let(:value){ -1744830463 }
      it { expect(subject.mainnet?).to eq false }
    end
  end

  describe '#testnet?' do
    it { expect(subject.testnet?).to eq false }

    context 'with testnet version' do
      let(:value){ -1744830463 }
      it { expect(subject.testnet?).to eq true }
    end
  end

  describe '#==' do
    it { expect(subject == other).to eq true }
  end

  describe '#to_s' do
    it { expect(subject.to_s).to eq 'mainnet' }
  end
end
