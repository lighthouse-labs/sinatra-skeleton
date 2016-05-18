require_relative '../spec_helper'


describe Song do
  let(:song) { Song.new }

  it 'belongs to an album' do
    expect(song.respond_to?(:album)).to be_truthy
  end
end
