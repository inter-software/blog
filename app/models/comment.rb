# frozen_string_literal: true

class Comment < ApplicationRecord # rubocop:todo Style/Documentation

  belongs_to :article
  has_many :publications, as: :published

  validates :commenter, presence: true

  validates :body, presence: true


  def report_comment

    "My Comments: #{commenter}, #{body}"

  end
  
  def search_comment

    ['Anna', 'carlos', 'charly', 'esteban'].map{|u| u.downcase }

  end

  def list_comment

    File.open("log.xml", "w"){|file| file.write "#{Time.now} - User Logged in \n"}

  end

  def load_hash

    hash = Hash.new

    for i in 1..3
      print 'ID: '
      hash[:id] = gets.chomp.to_s
      print 'Name: '
      hash[:name] = gets.chomp.to_s
      print 'Birtday Date: '
      hash[:date] = gets.chomp.to_i
    end

  end

  def count_comments
    Comment.count
  end
end












































