json.array!(@deals) do |deal|
  json.extract! deal, :id, :org_id, :name, :description, :default_url, :status, :expires_on, :commission, :commission_type
  json.url deal_url(deal, format: :json)
end
