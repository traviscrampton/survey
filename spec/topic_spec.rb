require('spec_helper')

describe(Topic) do
  it('Validates the presence of a name') do
    topic = Topic.new({:name => ''})
    expect(topic.save()).to eq(false)
  end
end
