require 'spec_helper'

describe LastHit::FileFilter::Ruby do
  describe '.filter' do
    let(:files) { [
      'app/models/user.rb',
      'service/author.rb',
      'lib/post.rb',
      'spec/service/user_spec.rb'
    ] }
    let(:ruby_files) { [
      'app/models/user.rb',
      'lib/post.rb'
    ] }

    it 'return files with extension is spec' do
      expect(LastHit::FileFilter::Ruby.filter(files)).to match_array(ruby_files)
    end
  end
end
