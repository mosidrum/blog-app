FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User#{n}" }
    bio { "A user's bio" }
    photo { 'user_profile_image.jpg' }
    posts_counter { 0 }

    trait :with_recent_posts do
      after(:create) do |user|
        create_list(:post, 3, author: user)
      end
    end
  end

  factory :post do
    association :author, factory: :user
    sequence(:title) { |n| "Post Title #{n}" }
    text { 'This is the content of the post.' }
    comments_counter { 0 }
    likes_counter { 0 }

    trait :with_comments do
      after(:create) do |post|
        create_list(:comment, 5, post)
      end
    end
  end

  factory :comment do
    association :user, factory: :user
    association :post, factory: :post
    text { 'This is a comment.' }
  end
end
