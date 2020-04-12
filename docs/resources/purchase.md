# Purchase resource

## Index GET

```ruby
DearInventory::Purchase.index
DearInventory::Purchase.()
```

### Parameters

| Name                    | Type     | Required |
| ----------------------- | -------- | -------- |
| page                    | Integer  | false    |
| limit                   | Integer  | false    |
| search                  | String   | false    |
| required_by             | DateTime | false    |
| updated_since           | DateTime | false    |
| order_status            | String   | false    |
| restock_received_status | String   | false    |
| invoice_status          | String   | false    |
| credit_note_status      | String   | false    |
| unstock_status          | String   | false    |
| status                  | String   | false    |
| drop_ship_task_id       | String   | false    |

### Response

The index endpoint returns a paginated set of purchase summary records. If you would like to load the full purchase, you can either use the helper method, `purchase`, or call the `DearInventory::Purchase` resource.

```ruby
DearInventory::Purchase.().each do |purchase_summary|
  purchase = purchase_summary.purchase
  # OR
  purchase = DearInventory::Purchase.show(id: purchase_summary.id)
end
```

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Purchase.()
response.fields # [:records, :total, :page, :purchases]
records = response.records
```



## Show GET

```ruby
DearInventory::Purchase.show
```

### Parameters

| Name | Type | Required |
| --- | --- | --- |
| id | String | True |
| combine_additional_charges | Boolean | false |

### Response

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Purchase.show(id: "abcdef01-2345-6789-abcd-ef0123456789")
response.fields # [:id, :supplier_id, :supplier, :contact, :phone, :inventory_account, :blind_receipt, :approach, :billing_address, :shipping_address, :base_currency, :supplier_currency, :tax_rule, :tax_calculation, :terms, :required_by, :location, :note, :order_number, :order_date, :status, :related_drop_ship_sale_task, :currency_rate, :last_updated_date, :order, :stock_received, :invoice, :credit_note, :manual_journals, :additional_attributes, :attachments, :inventory_movements]
id = response.id # abcdef01-2345-6789-abcd-ef0123456789
```

