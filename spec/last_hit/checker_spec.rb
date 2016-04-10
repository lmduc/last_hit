require 'spec_helper'

describe LastHit::Checker do
  describe '.filter' do
    let(:checker) { LastHit::Checker }
    let(:ruby_files) { [
      'app/models/user.rb',
      'app/models/post.rb',
      'lib/signin.rb',
      'lib/publish.rb'
    ] }
    let(:test_files) { [
      'spec/models/user_spec.rb',
      'spec/lib/signin_spec.rb'
    ] }
    let(:no_test_files) { [
      'app/models/post.rb',
      'lib/publish.rb'
    ] }

    it 'return ruby files that do not have tests' do
      results = checker.send(:filter, ruby_files, test_files)
      expect(results).to match_array(no_test_files)
    end
  end
end
