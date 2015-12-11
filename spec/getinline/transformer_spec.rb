require 'spec_helper'

describe Getinline::Transformer do
  context '#transform' do
    context 'no erb tags' do
      let(:raw_basic) { File.read('spec/fixtures/raw/basic.erb') }
      let(:inlined_basic) { File.read('spec/fixtures/inlined/basic.erb') }

      let(:transformer) { described_class.new(raw_basic) }
      let(:transformed_text) { transformer.transform }

      it 'renders inlined html' do
        expect(transformed_text).to include(inlined_basic)
      end
    end

    context 'with erb tags' do
      let(:raw_with_tags) { File.read('spec/fixtures/raw/with-tags.erb') }
      let(:inlined_with_tags) { File.read('spec/fixtures/inlined/with-tags.erb') }

      let(:transformer) { described_class.new(raw_with_tags) }
      let(:transformed_text) { transformer.transform }

      it 'renders inlined html' do
        expect(transformed_text).to include(inlined_with_tags)
      end
    end
  end
end
