require 'rails_helper'

RSpec.describe Student, type: :model do

  let(:student) { build(:student) }

  describe "ActiveModel validations" do
    # Basic validations
    it { expect(student).to validate_numericality_of(:roll_number).is_greater_than_or_equal_to(1) }

    # Format validations
    it { expect(student).to allow_value("Samuel").for(:name) }
    it { expect(student).to allow_value("Delhi").for(:city) }
  end

  describe "ActiveRecord associations" do

    # Associations
    it { expect(student).to have_and_belong_to_many(:subjects) }
    it { expect(student).to have_many(:teachers).through(:subjects) }

    # Databse columns/indexes
    it { expect(student).to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { expect(student).to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

  end
end
