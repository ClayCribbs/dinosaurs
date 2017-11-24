RSpec.describe UserMailer, type: :mailer do
  describe '#send_welcome_email(user)' do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.send_welcome_email(user)}

    it 'renders the headers' do
      expect(mail.subject).to eq('Welcome to our site!')
      expect(mail.to).to      eq([user.email])
      expect(mail.from).to    eq(['from@example.com'])
    end

    it 'includes Users email in the message body' do
      expect(mail.body.encoded).to match(user.email)
    end
  end
end
