# Purchases resource

## GET

```ruby
DearInventory::Purchases.index
DearInventory::Purchases.()
```

### Parameters

| Name | Type | Required |
| --- | --- | --- |
| page | Integer | false |
| limit | Integer | false |
| search | String | false |
| required_by | DateTime | false |
| updated_since | DateTime | false |
| order_status | String | false |
| restock_received_status | String | false |
| invoice_status | String | false |
| credit_note_status | String | false |
| unstock_status | String | false |
| status | String | false |
| drop_ship_task_id | String | false |

### Response

The purchases resource returns a paginated set of purchase summary records. If you would like to load the full purchase, you can either use the helper method, `purchase`, or call the `DearInventory::Purchase` resource.

```ruby
DearInventory::Purchases.().each do |purchase_summary|
  purchase = purchase_summary.purchase
  # OR
  purchase = DearInventory::Purchase.(id: purchase.id)
end
```

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Purchases.()
response.fields # [:records, :total, :page, :purchases]
records = response.records
```

