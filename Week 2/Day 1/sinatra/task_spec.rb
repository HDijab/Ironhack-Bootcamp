require 'rspec'
require './task'
require 'pry'

describe 'Task' do
  before :each do
    @subject = Task.new('Buy the milk')
  end

  describe '#updated_at' do
    it 'initializes @updated_at = nil' do
      expect(@subject.updated_at).to eq(nil)
    end
  end

  describe '#complete?' do
    it 'returns status of @completed' do
      expect(@subject.complete?).to eq(@subject.completed)
    end
  end

  describe '#complete!' do
    it 'changes @completed = true' do
      expect(@subject.complete!).to eq(@subject.completed)
    end
  end

  describe '#make_incomplete!' do
    it 'changes @completed = false' do
      expect(@subject.make_incomplete!).to eq(@subject.completed)
    end
  end

  describe '#update_content!' do
    it 'changes @content given parameter updates @updated_at' do
      expect(@subject.update_content!('Walk the dog')).to eq(@subject.content && @subject.updated_at)
    end
  end
end

describe 'TodoList' do
  before :each do
    @subject = TodoList.new
    @object = Task.new('Walk the dog')
  end

  describe '#initialize' do
    it 'creates empty @tasks' do
      expect(@subject.tasks.empty?).to eq(@subject.tasks.empty? == true)
    end
  end

  describe '#add_task' do
    it 'adds given task to @tasks' do
      expect(@subject.add_task(@object)).to include(@object)
    end
  end

  describe '#delete_task' do
    it 'remove given task from @tasks' do
      @subject.add_task(@object)
      expect(@subject.delete_task(8)).to eq(@object)
    end
  end

  describe '#find_task_by_id' do
    it 'returns task with matching @id' do
      @subject.add_task(@object)
      expect(@subject.find_task_by_id(9)).to eq(@object)
    end
  end

  describe '#find_task_by_id' do
    it 'returns nil if no matching @id' do
      @subject.add_task(@object)
      expect(@subject.find_task_by_id(12)).to eq(nil)
    end
  end

  describe '#sort_by_created' do
    it 'returns nil if no matching @id' do
      @subject.add_task(@object)
      @subject.add_task(Task.new('Milk the dog'))
      expect(@subject.sort_by_created).to eq(@subject.tasks.sort_by(&:created_at))
    end
  end

  describe '#sort_by_created' do
    it 'returns nil if no matching @id' do
      @subject.add_task(@object)
      @subject.add_task(Task.new('Milk the dog'))
      expect(@subject.sort_by_created('DESC')).to eq(@subject.tasks.sort_by(&:created_at).reverse)
    end
  end
end