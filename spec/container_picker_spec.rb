require 'spec_helper'
require './lib/container_picker'

describe ContainerPicker do
  subject { described_class.new(containers) }

  describe '#choose' do
    context 'basic set of containers and sizes' do
      let(:containers) { [2, 3, 5] }

      context 'when size is 6' do
        it 'should result in 3 and 3' do
          expect(subject.choose(6)).to match_array([3, 3])
        end
      end

      context 'when size is 9' do
        it 'should result in 3, 3, 3' do
          expect(subject.choose(9)).to match_array([3, 3, 3])
        end
      end

      context 'when size is 11' do
        it 'should result in 5, 3, 3' do
          expect(subject.choose(11)).to match_array([5, 3, 3])
        end
      end

      context 'when size is 1' do
        it 'should result in 1' do
          expect(subject.choose(1)).to match_array([2])
        end
      end
    end

    context 'when only 2 containers are used' do
      let(:containers) { [4, 2] }

      context 'when size is 8' do
        it 'should result in 4, 4' do
          expect(subject.choose(8)).to match_array([4, 4])
        end
      end

      context 'when size is 5' do
        it 'should result in 4, 2' do
          expect(subject.choose(5)).to match_array([4, 2])
        end
      end
    end
  end
end
