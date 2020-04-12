# Sale resource

## GET

```ruby
DearInventory::Sale.index
DearInventory::Sale.()
```

### Parameters

| Name | Type | Required |
| --- | --- | --- |
| id | String | True |
| combine_additional_charges | Boolean | false |
| hide_inventory_movements | Boolean | false |
| include_transactions | Boolean | false |

### Response

To see what data is available in the response, you can call the `field` method:

```ruby
response = DearInventory::Sale.(id: "abcdef01-2345-6789-abcd-ef0123456789")
response.fields # [:id, :customer, :customer_id, :contact, :phone, :email, :default_account, :skip_quote, :billing_address, :shipping_address, :base_currency, :customer_currency, :tax_rule, :tax_calculation, :terms, :price_tier, :ship_by, :location, :sale_order_date, :last_modified_on, :note, :customer_reference, :cogs_amount, :status, :combined_picking_status, :combined_packing_status, :combined_shipping_status, :fulfilment_status, :combined_invoice_status, :combined_payment_status, :combined_tracking_numbers, :carrier, :currency_rate, :sales_representative, :type, :source_channel, :external_id, :service_only, :quote, :order, :fulfilments, :invoices, :credit_notes, :manual_journals, :additional_attributes, :attachments, :inventory_movements, :transactions]
id = response.id # abcdef01-2345-6789-abcd-ef0123456789
```

