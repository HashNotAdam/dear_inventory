# Product resource

## GET

```ruby
DearInventory::Product.index
DearInventory::Product.()
```

### Parameters
| Name | Type | Required |
| --- | --- | --- |
| id | String | false |
| page | Integer | false |
| limit | Integer | false |
| name | String | false |
| sku | String | false |
| modified_since | DateTime | false |
| include_attachments | Boolean | false |
| include_bom | Boolean | false |
| include_deprecated | Boolean | false |
| include_movements | Boolean | false |
| include_reorder_levels | Boolean | false |
| include_suppliers | Boolean | false |

### Response

A paginated set of records.

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Product.()
response.fields # [:records, :total, :page, :products]
records = response.records
```

