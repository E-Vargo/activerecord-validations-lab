class Post < ActiveRecord::Base
    #include ActiveModel::Validations

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait?

    BAIT = [
      /Won't Believe/i, /Secret/i, /Top [number]/i, /Guess/i
    ]
  
    def clickbait?
      if BAIT.none? { |p| p.match title }
      errors[:title] << "Not click-batey enough!!"
      end
    end
  end
