# Purchase resource

## GET

```ruby
DearInventory::Purchase.index
DearInventory::Purchase.()
```

### Parameters

| Name | Type | Required |
| --- | --- | --- |
| id | String | True |
| combine_additional_charges | Boolean | false |

### Response

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Purchase.(id: "abcdef01-2345-6789-abcd-ef0123456789")
response.fields # [:id, :supplier_id, :supplier, :contact, :phone, :inventory_account, :blind_receipt, :approach, :billing_address, :shipping_address, :base_currency, :supplier_currency, :tax_rule, :tax_calculation, :terms, :required_by, :location, :note, :order_number, :order_date, :status, :related_drop_ship_sale_task, :currency_rate, :last_updated_date, :order, :stock_received, :invoice, :credit_note, :manual_journals, :additional_attributes, :attachments, :inventory_movements]
id = response.id # abcdef01-2345-6789-abcd-ef0123456789
```

