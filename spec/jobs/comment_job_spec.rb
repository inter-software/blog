# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CommentJob, type: :job do
  it 'Matches with enqueued job' do
    ActiveJob::Base.queue_adapter = :test
    UploadBackups.perform_later('commnet-backup.txt', 'articles-backup.txt')
    expect(UploadBackups).to have_been_enqueued.with('comment-backup.txt', 'articles-backup.txt')
  end
end
