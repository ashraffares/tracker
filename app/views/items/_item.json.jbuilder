json.extract! item, :id, :name, :amount, :user_id, :group_id, :created_at, :updated_at
json.url item_url(item, format: :json)
