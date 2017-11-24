module EnsureSecureId
  extend ActiveSupport::Concern

  included do
    private

    def _ensure_secure_id
      unless self.secure_id.present?
        secure_id_value = SecureRandom.hex(8)

        until self.class.find_by(secure_id: secure_id_value) == nil
          secure_id_value = SecureRandom.hex(8)
        end

        self.secure_id  = secure_id_value
      end
    end
  end
end
