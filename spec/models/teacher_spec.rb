require 'rails_helper'

RSpec.describe Teacher, type: :model do
  
  let(:teacher) { build(:teacher) }

  describe "ActiveModel validations" do

    # Format validations
    it { expect(teacher).to allow_value("Samuel").for(:name) }
    it { expect(teacher).to validate_inclusion_of(:education).in_array(["Graduate", "Masters"]) }
  end

  describe "ActiveRecord associations" do

    # Associations
    it { expect(teacher).to have_and_belong_to_many(:subjects) }
    it { expect(teacher).to have_many(:students).through(:subjects) }

    # Databse columns/indexes
    it { expect(teacher).to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { expect(teacher).to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

  end
end
