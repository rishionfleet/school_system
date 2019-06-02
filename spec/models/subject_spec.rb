require 'rails_helper'

RSpec.describe Subject, type: :model do
  let(:subject) { create(:subject) }

  describe "ActiveModel validations" do

    # Format validations
    it { expect(subject).to allow_value("Samuel").for(:name) }
  end

  describe "ActiveRecord associations" do

    # Associations
    it { expect(subject).to have_and_belong_to_many(:students) }
    it { expect(subject).to have_and_belong_to_many(:teachers) }

    # Databse columns/indexes
    it { expect(subject).to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { expect(subject).to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

  end
end
