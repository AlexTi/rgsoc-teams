class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :conference

  def github_handle
    user.try(:github_handle)
  end

  def github_handle=(github_handle)
    self.user = github_handle.present? && User.where(github_handle: github_handle).first || build_user
    user.github_handle = github_handle
  end
end
