# typed: strong
# frozen_string_literal: true

module DearInventory
  module Models
    class Product < DearInventory::Model
      extend T::Sig

      fields(
        ID: {
          name: :id,
          type: :Guid,
        },
        SKU: {
          name: :sku,
          type: :String,
        },
        Name: {
          name: :name,
          type: :String,
        },
        Category: {
          name: :category,
          type: :String,
        },
        Brand: {
          name: :brand,
          type: :String,
        },
        Type: {
          name: :type,
          type: :String,
        },
        CostingMethod: {
          name: :costing_method,
          type: :String,
        },
        DropShipMode: {
          name: :drop_ship_mode,
          type: :String,
        },
        DefaultLocation: {
          name: :default_location,
          type: :String,
        },
        Length: {
          name: :length,
          type: :Float,
        },
        Width: {
          name: :width,
          type: :Float,
        },
        Height: {
          name: :height,
          type: :Float,
        },
        Weight: {
          name: :weight,
          type: :Float,
        },
        UOM: {
          name: :uom,
          type: :String,
        },
        WeightUnits: {
          name: :weight_units,
          type: :String,
        },
        DimensionsUnits: {
          name: :dimensions_units,
          type: :String,
        },
        Barcode: {
          name: :barcode,
          type: :String,
        },
        MinimumBeforeReorder: {
          name: :minimum_before_reorder,
          type: :Float,
        },
        ReorderQuantity: {
          name: :reorder_quantity,
          type: :Float,
        },
        PriceTier1: {
          name: :price_tier_1,
          type: :BigDecimal,
        },
        PriceTier2: {
          name: :price_tier_2,
          type: :BigDecimal,
        },
        PriceTier3: {
          name: :price_tier_3,
          type: :BigDecimal,
        },
        PriceTier4: {
          name: :price_tier_4,
          type: :BigDecimal,
        },
        PriceTier5: {
          name: :price_tier_5,
          type: :BigDecimal,
        },
        PriceTier6: {
          name: :price_tier_6,
          type: :BigDecimal,
        },
        PriceTier7: {
          name: :price_tier_7,
          type: :BigDecimal,
        },
        PriceTier8: {
          name: :price_tier_8,
          type: :BigDecimal,
        },
        PriceTier9: {
          name: :price_tier_9,
          type: :BigDecimal,
        },
        PriceTier10: {
          name: :price_tier_10,
          type: :BigDecimal,
        },
        PriceTiers: {
          name: :price_tiers,
          type: :Untyped
        },
        AverageCost: {
          name: :average_cost,
          type: :BigDecimal,
        },
        ShortDescription: {
          name: :short_description,
          type: :String,
        },
        Description: {
          name: :description,
          type: :String,
        },
        AdditionalAttribute1: {
          name: :additional_attribute_1,
          type: :String,
        },
        AdditionalAttribute2: {
          name: :additional_attribute_2,
          type: :String,
        },
        AdditionalAttribute3: {
          name: :additional_attribute_3,
          type: :String,
        },
        AdditionalAttribute4: {
          name: :additional_attribute_4,
          type: :String,
        },
        AdditionalAttribute5: {
          name: :additional_attribute_5,
          type: :String,
        },
        AdditionalAttribute6: {
          name: :additional_attribute_6,
          type: :String,
        },
        AdditionalAttribute7: {
          name: :additional_attribute_7,
          type: :String,
        },
        AdditionalAttribute8: {
          name: :additional_attribute_8,
          type: :String,
        },
        AdditionalAttribute9: {
          name: :additional_attribute_9,
          type: :String,
        },
        AdditionalAttribute10: {
          name: :additional_attribute_10,
          type: :String,
        },
        AttributeSet: {
          name: :attribute_set,
          type: :String,
        },
        DiscountRule: {
          name: :discount_rule,
          type: :String,
        },
        Tags: {
          name: :tags,
          type: :String,
        },
        Status: {
          name: :status,
          type: :String,
        },
        StockLocator: {
          name: :stock_locator,
          type: :String,
        },
        COGSAccount: {
          name: :cogs_account,
          type: :String,
        },
        RevenueAccount: {
          name: :revenue_account,
          type: :String,
        },
        ExpenseAccount: {
          name: :expense_account,
          type: :String,
        },
        InventoryAccount: {
          name: :inventory_account,
          type: :String,
        },
        PurchaseTaxRule: {
          name: :purchase_tax_rule,
          type: :String,
        },
        SaleTaxRule: {
          name: :sale_tax_rule,
          type: :String,
        },
        LastModifiedOn: {
          name: :last_modified_on,
          type: :DateTime,
        },
        Sellable: {
          name: :sellable,
          type: :Boolean,
        },
        PickZones: {
          name: :pick_zones,
          type: :String,
        },
        BillOfMaterial: {
          name: :bill_of_material,
          type: :Boolean,
        },
        AutoAssembly: {
          name: :auto_assembly,
          type: :Boolean,
        },
        AutoDisassembly: {
          name: :auto_disassembly,
          type: :Boolean,
        },
        QuantityToProduce: {
          name: :quantity_to_produce,
          type: :Float,
        },
        AssemblyInstructionURL: {
          name: :assembly_instruction_url,
          type: :String,
        },
        AssemblyCostEstimationMethod: {
          name: :assembly_cost_estimation_method,
          type: :String,
        },
        Suppliers: {
          name: :suppliers,
          type: :Array,
          model: DearInventory::Models::Supplier,
        },
        ReorderLevels: {
          name: :reorder_levels,
          type: :Array,
          model: DearInventory::Models::ReorderLevel,
        },
        BillOfMaterialsProducts: {
          name: :bill_of_materials_products,
          type: :Array,
          model: DearInventory::Models::BillOfMaterialsProduct,
        },
        BillOfMaterialsServices: {
          name: :bill_of_materials_services,
          type: :Array,
          model: DearInventory::Models::BillOfMaterialsService,
        },
        Movements: {
          name: :movements,
          type: :Array,
          model: DearInventory::Models::Products::Movement,
        },
        Attachments: {
          name: :attachments,
          type: :Array,
          model: DearInventory::Models::Attachment,
        }
      )
    end
  end
end
