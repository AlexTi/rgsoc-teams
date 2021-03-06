require 'spec_helper'

describe Role do
  it { should belong_to(:team) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:name) }
  it { should ensure_inclusion_of(:name).in_array(Role::ROLES) }
  it { should validate_uniqueness_of(:user_id).scoped_to([:team_id, :name]) }
end
