json.extract! tran, :id, :title, :total, :user_id, :created_at, :updated_at
json.url tran_url(tran, format: :json)
