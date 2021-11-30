require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should include the "category_id" attribute' do
    expect(subject.attributes).to include("category_id") 
  end

  it 'should include the "name" attribute' do
    expect(subject.attributes).to include("name")
  end

  it 'should include the "body" attribute' do
    expect(subject.attributes).to include("body")
  end

  it 'should include the "task_date" attribute' do
    expect(subject.attributes).to include("task_date")
  end
end
