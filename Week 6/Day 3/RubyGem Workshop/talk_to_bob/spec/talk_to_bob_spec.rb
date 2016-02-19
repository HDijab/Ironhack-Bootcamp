require 'spec_helper'

describe TalkToBob do
  it 'has a version number' do
    expect(TalkToBob::VERSION).not_to be nil
  end

  it 'responds with whatever' do
    remark = 'hey'
    expect(TalkToBob::Bob.hey(remark)).to eq('whatever')
  end
end
