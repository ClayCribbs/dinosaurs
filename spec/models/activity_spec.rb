require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe '#validations' do
    it 'is valid if required fields are present' do
      activity = build(:activity)
      expect(activity).to be_valid
      expect(activity.errors).to be_empty
    end
  end

  describe '#ensure_description' do
    it 'ensures the presence of a description before save' do
      activity = create(:activity, description: nil)

      expect(activity.description).not_to be(nil)
    end

    it 'does not override a description if one is present' do
      unique_description = "Description: #{SecureRandom.hex(12)}"
      activity           = create(:activity, description: unique_description)

      expect(activity.description).to eq(unique_description)
    end

    context 'given a Trackable that has a username' do
      it 'sets the description based on the User, Trackable, and action if all three are present' do
        user      = create(:user, username: 'Ben')
        trackable = create(:user, username: 'Piper')
        activity  = create(:activity, user: user, trackable: trackable, action: 'walk', description: nil)

        expected_description = "walked Piper."

        expect(activity.description).to eq(expected_description)
      end
    end

    context 'given a Trackable with no username' do
      it 'sets the description based on the User, Trackable, and action if all three are present' do
        user      = create(:user, username: 'Ben')
        trackable = create(:activity)
        activity  = create(:activity, user: user, trackable: trackable, action: 'create', description: nil)

        expected_description = "created an Activity."

        expect(activity.description).to eq(expected_description)
      end
    end
  end
end
