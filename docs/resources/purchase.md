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

The index endpoint returns a paginated set of purchase summary records. If you would like to load the full purchase, you can either use the helper method, `full_record`, or call the appropriate resource directly, keeping in mind that Simple and Advanced/Service purchases have different resources... because DEAR :shrug:

```ruby
DearInventory::Purchase.().records.each do |purchase_summary|
  purchase = purchase_summary.full_record
end
```

```ruby
DearInventory::Purchase.().records.each do |purchase_summary|
  purchase =
    case purchase_summary.type
    when "Advanced Purchase", "Service Purchase"
      DearInventory::AdvancedPurchase.show(id: purchase_summary.id)
    else
      DearInventory::Purchase.show(id: purchase_summary.id)
    end
end
```

If you use the `each` helper method, it will automatically return the full record each time. Given it makes n+1 API requests, the time per iteration will be a lot slower than iterating over `records` directly, however, it's much nicer if you intend to load every record anway.

```ruby
DearInventory::Purchase.().each do |purchase|
  so_stuff_with_the_full_purchase_record(purchase)
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
| id | String | true |
| combine_additional_charges | Boolean | false |

### Response

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Purchase.show(id: "abcdef01-2345-6789-abcd-ef0123456789")
response.fields # [:id, :supplier_id, :supplier, :contact, :phone, :inventory_account, :blind_receipt, :approach, :billing_address, :shipping_address, :base_currency, :supplier_currency, :tax_rule, :tax_calculation, :terms, :required_by, :location, :note, :order_number, :order_date, :status, :related_drop_ship_sale_task, :currency_rate, :last_updated_date, :order, :stock_received, :invoice, :credit_note, :manual_journals, :additional_attributes, :attachments, :inventory_movements]
id = response.id # abcdef01-2345-6789-abcd-ef0123456789
```

