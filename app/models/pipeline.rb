# A single pipeline
class Pipeline < ActiveRecord::Base
  validates :name, presence: true

  has_many :steps
  accepts_nested_attributes_for :steps

  def perform(seed = nil)
    return to_enum(:perform, seed) unless block_given?

    results = steps.inject(wrap_seed(seed)) do |memo, step|
      step.perform(memo)
    end

    results.each do |r|
      yield r
    end
  end

  private

  def wrap_seed(record_or_enumerable)
    return to_enum(:wrap_seed, record_or_enumerable) unless block_given?

    if record_or_enumerable.respond_to? :each
      record_or_enumerable.each do |x|
        yield Message.wrap(x)
      end
    else
      yield Message.wrap(record_or_enumerable)
    end
  end
end
