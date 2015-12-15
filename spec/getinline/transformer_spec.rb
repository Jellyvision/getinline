require 'spec_helper'

describe Getinline::Transformer do
  context '#transform' do
    context 'no erb tags' do
      let(:raw_basic) { File.read('spec/fixtures/raw/basic.erb') }
      let(:text_basic) { File.read('spec/fixtures/text/basic.erb') }
      let(:inlined_basic) { File.read('spec/fixtures/inlined/basic.erb') }

      context 'inlined' do
        let(:transformer) { described_class.new(raw_basic) }
        let(:transformed_html) { transformer.transform }
        it 'renders inlined html' do
          expect(transformed_html).to include(inlined_basic)
        end
      end

      context 'plain text' do
        let(:transformer) { described_class.new(raw_basic, mode: :txt) }
        let(:transformed_text) { transformer.transform }
        it 'renders plain text' do
          expect(transformed_text).to include(text_basic)
        end
      end
    end

    context 'with erb tags' do
      let(:raw_with_tags) { File.read('spec/fixtures/raw/with-tags.erb') }
      let(:text_with_tags) { File.read('spec/fixtures/text/with-tags.erb') }
      let(:inlined_with_tags) { File.read('spec/fixtures/inlined/with-tags.erb') }

      context 'inlined' do
        let(:transformer) { described_class.new(raw_with_tags) }
        let(:transformed_html) { transformer.transform }
        it 'renders inlined html' do
          expect(transformed_html).to include(inlined_with_tags)
        end
      end

      context 'plain text' do
        let(:transformer) { described_class.new(raw_with_tags, mode: :txt) }
        let(:transformed_text) { transformer.transform }
        it 'renders plain text' do
          expect(transformed_text).to include(text_with_tags)
        end
      end
    end
  end
end