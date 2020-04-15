# Customer resource

## GET

```ruby
DearInventory::Customer.index
DearInventory::Customer.()
```

### Parameters
| Name | Type | Required |
| --- | --- | --- |
| id | String | false |
| page | Integer | false |
| limit | Integer | false |
| name | String | false |
| modified_since | DateTime | false |
| include_deprecated | Boolean | false |

### Response

The index endpoint returns a paginated set of records.

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Customer.()
response.fields # [:records, :total, :page, :sale_list]
records = response.records
```

