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

  it 'not valid without name' do
    task.category_id = 1
    task.name = nil
    task.body = 'Body of Task'

    expect(task).to_not be_valid
    expect(task.errors).to be_present
    expect(task.errors.to_h.keys).to include(:name)
  end

  it 'not valid without body' do
    task.category_id = 1
    task.name = 'Body of Task'
    task.body = nil

    expect(task).to_not be_valid
    expect(task.errors).to be_present
    expect(task.errors.to_h.keys).to include(:body)
  end

end

  