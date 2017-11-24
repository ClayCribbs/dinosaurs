class Activity < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :trackable, polymorphic: true

  before_save :ensure_description

  def ensure_description
    unless description.present?
      if !!user && !!trackable && !!action
        person = user.username
        verb   = action.sub(/e?$/, 'ed')
        target = %w(a e i o u).include?(trackable.class.name[0].downcase) ? "an #{trackable.class.name}" : "a #{trackable.class.name}"
        target = trackable.username if !!trackable.has_attribute?(:username)
        target = trackable.title    if !!trackable.has_attribute?(:title)

        self.description = "#{verb} #{target}."
      else
        self.description = 'Unspecified Activity.'
      end
    end
  end
end
