require 'rails_helper'

describe ::Course::Lecture, type: %i[model lecture] do
  it { should belong_to :parent_lecture }
  it { should belong_to :course }
end
