# Sales resource

## GET

```ruby
DearInventory::Sales.index
DearInventory::Sales.()
```

### Parameters

| Name | Type | Required |
| --- | --- | --- |
| page | Integer | false |
| limit | Integer | false |
| search | String | false |
| created_since | DateTime | false |
| updated_since | DateTime | false |
| ship_by | DateTime | false |
| quote_status | String | false |
| order_status | String | false |
| combined_invoice_status | String | false |
| combined_pick_status | String | false |
| combined_pack_status | String | false |
| combined_shipp_status | String | false |
| credit_note_status | String | false |
| external_id | String | false |
| status | String | false |
| ready_for_shipping | Boolean | false |

### Response

The purchases resource returns a paginated set of purchase summary records. If you would like to load the full purchase, you can either use the helper method, `purchase`, or call the `DearInventory::Purchase` resource.

```ruby
DearInventory::Sales.().each do |sale_summary|
  sale = sale_summary.sale
  # OR
  sale = DearInventory::Sale.(id: sale.id)
end
```

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Sales.()
response.fields # [:records, :total, :page, :sales]
records = response.records
```

