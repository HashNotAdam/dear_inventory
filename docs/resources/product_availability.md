# Product resource

## GET

```ruby
DearInventory::ProductAvailability.index
DearInventory::ProductAvailability.()
```

### Parameters
| Name | Type | Required |
| --- | --- | --- |
| id | String | false |
| page | Integer | false |
| limit | Integer | false |
| name | String | false |
| sku | String | false |
| location | String | false |
| batch | String | false |
| category | String | false |

### Response

The index endpoint returns a paginated set of records.

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::ProductAvailability.()
response.fields # [:records, :total, :page, :product_availabilities]
records = response.records
```

