# Sale resource

## Index GET

```ruby
DearInventory::Sale.index
DearInventory::Sale.()
```

### Parameters

| Name                    | Type     | Required |
| ----------------------- | -------- | -------- |
| page                    | Integer  | false    |
| limit                   | Integer  | false    |
| search                  | String   | false    |
| created_since           | DateTime | false    |
| updated_since           | DateTime | false    |
| ship_by                 | DateTime | false    |
| quote_status            | String   | false    |
| order_status            | String   | false    |
| combined_invoice_status | String   | false    |
| combined_pick_status    | String   | false    |
| combined_pack_status    | String   | false    |
| combined_shipp_status   | String   | false    |
| credit_note_status      | String   | false    |
| external_id             | String   | false    |
| status                  | String   | false    |
| ready_for_shipping      | Boolean  | false    |

### Response

The index endpoint returns a paginated set of sale summary records. If you would like to load the full purchase, you can either use the helper method, `full_record`, or call `DearInventory::Sale.show` resource.

```ruby
DearInventory::Sale.().records.each do |sale_summary|
  sale = sale_summary.full_record
end
```

```ruby
DearInventory::Sale.().records.each do |sale_summary|
  sale = DearInventory::Sale.show(id: sale_summary.id)
end
```

If you use the `each` helper method, it will automatically return the full record each time. Given it makes n+1 API requests, the time per iteration will be a lot slower than iterating over `records` directly, however, it's much nicer if you intend to load every record anway.

```ruby
DearInventory::Sale.().each do |sale|
  so_stuff_with_the_full_sale_record(sale)
end
```

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Sale.()
response.fields # [:records, :total, :page, :sales]
records = response.records
```



## Show GET

```ruby
DearInventory::Sale.show
```

### Parameters

| Name | Type | Required |
| --- | --- | --- |
| id | String | true |
| combine_additional_charges | Boolean | false |
| hide_inventory_movements | Boolean | false |
| include_transactions | Boolean | false |

### Response

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Sale.show(id: "abcdef01-2345-6789-abcd-ef0123456789")
response.fields # [:id, :customer, :customer_id, :contact, :phone, :email, :default_account, :skip_quote, :billing_address, :shipping_address, :base_currency, :customer_currency, :tax_rule, :tax_calculation, :terms, :price_tier, :ship_by, :location, :sale_order_date, :last_modified_on, :note, :customer_reference, :cogs_amount, :status, :combined_picking_status, :combined_packing_status, :combined_shipping_status, :fulfilment_status, :combined_invoice_status, :combined_payment_status, :combined_tracking_numbers, :carrier, :currency_rate, :sales_representative, :type, :source_channel, :external_id, :service_only, :quote, :order, :fulfilments, :invoices, :credit_notes, :manual_journals, :additional_attributes, :attachments, :inventory_movements, :transactions]
id = response.id # abcdef01-2345-6789-abcd-ef0123456789
```



## Delete DELETE

```ruby
DearInventory::Sale.delete
```

### Parameters

| Name | Type | Required | Default |
| --- | --- | --- | --- |
| id | String | true | N/A |
| void | Boolean | false | false |

### Response

A new copy of the record is returned. To see what data is available in the
response, you can call the `field` method:

```ruby
response = DearInventory::Sale.delete(
  id: "abcdef01-2345-6789-abcd-ef0123456789",
  void: true
)
response.fields # [:id, :customer, :customer_id, :contact, :phone, :email, :default_account, :skip_quote, :billing_address, :shipping_address, :base_currency, :customer_currency, :tax_rule, :tax_calculation, :terms, :price_tier, :ship_by, :location, :sale_order_date, :last_modified_on, :note, :customer_reference, :cogs_amount, :status, :combined_picking_status, :combined_packing_status, :combined_shipping_status, :fulfilment_status, :combined_invoice_status, :combined_payment_status, :combined_tracking_numbers, :carrier, :currency_rate, :sales_representative, :type, :source_channel, :external_id, :service_only, :quote, :order, :fulfilments, :invoices, :credit_notes, :manual_journals, :additional_attributes, :attachments, :inventory_movements, :transactions]
id = response.id # abcdef01-2345-6789-abcd-ef0123456789
```
