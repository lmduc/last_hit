require 'spec_helper'

describe LastHit::FileFilter::Spec do
  describe '.filter' do
    let(:files) { ['model.rb', 'model_spec.rb'] }
    let(:spec_files) { ['model_spec.rb'] }

    it 'return files with extension is spec' do
      expect(LastHit::FileFilter::Spec.filter(files)).to eq(spec_files)
    end
  end
end
