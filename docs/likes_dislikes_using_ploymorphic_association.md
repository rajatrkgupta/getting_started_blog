# Like/Dislike feature using Polymorphic Association

## Polymorphic Association

With [polymorphic associations](https://guides.rubyonrails.org/association_basics.html#polymorphic-associations), a model can belong to more than one other model, on a single association.

Please Look at [Pull Request](https://github.com/rajatrkgupta/getting_started_blog/pull/1) of like/dislike feature using polymorphic association.

## Requirements

- We are creating like/dislike functionality of Article/Comments with the polymorphic association.

- We need to add a devise gem for getting current login user who is going to like Articles or comments because one user can only like/dislike one time.

## Let's Start

### Specify Associations
Stracture like this...
```
class Like < ApplicationRecord
  belongs_to :liked_to, polymorphic: true
  belongs_to :user
end

class Article < ApplicationRecord
  has_many :likes, as: :liked_to, dependent: :destroy
end

class Comment < ApplicationRecord
  has_many :likes, as: :liked_to, dependent: :destroy
end
```
For getting user's all likes
```
class User < ApplicationRecord
  has_many :likes, dependent: :destroy
end
```

### Generate a migration to create likes table
```
$ rails g migration CreateLikes
```

Migration file content looks like this
```
class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.string :liked_to_type, null: false
      t.integer :liked_to_id, null: false
      t.timestamps
    end

    add_index :likes, [:liked_to_type, :liked_to_id]
    add_index :likes, :user_id
  end
end
```
And run
```
$ rails db:migrate
```

### Add Like/Dislike route

Add a route in routes.rb which use to like or dislike articles and comments
```
post "like/:record_type/:record_id", to: "likes#like_toggle", as: "like_record"
```

### Generate a LikesController
```
class LikesController < ApplicationController

  def like_toggle
    record_type = params[:record_type]
    record = record_type.classify.constantize.find(params[:record_id])

    if record.is_liked_by_user?(current_user.id)
      record.likes.find_by_user_id(current_user.id).delete
      message = I18n.t("#{record_type.pluralize}.like_toggle.dislike")
    else
      record.likes.create(user_id: current_user.id)
      message = I18n.t("#{record_type.pluralize}.like_toggle.like")
    end

    redirect_to request.referer, notice: message
  end
end
```

### To check Article/Comment is liked? or not
Add this method in both article.rb and comment.rb or user concern for that
```
 def is_liked_by_user?(user_id)
    self.likes.find_by_user_id(user_id).present?
  end
```

### Create a LikesHelper
```
module LikesHelper
  def like_toggle_link(record)
    link_title = record.is_liked_by_user?(current_user.id) ? "Dislike" : "Like"

    link_to link_title,
      like_record_path(record_id: record.id, record_type: record.class.name.parameterize),
      method: :post, title: "Click to #{link_title}"
  end
end
```

### Add static messages in en.yml
```
en:
  articles:
    like_toggle:
      like: "This article liked succfully"
      dislike: "This article disliked succfully"
  comments:
    like_toggle:
      like: "Comment liked succfully"
      dislike: "Comment disliked succfully"
```

### Add Like/Dislike link on show page

Add like/dislike link in article/show page
```
<li><%= like_toggle_link(@article) %> <span>(<%= @article.likes.count %>)</span></li>
```

Add like/dislike link in comments/show page
```
<%= like_toggle_link(comment) %> <span>(<%= comment.likes.count %>)</span> |
```
