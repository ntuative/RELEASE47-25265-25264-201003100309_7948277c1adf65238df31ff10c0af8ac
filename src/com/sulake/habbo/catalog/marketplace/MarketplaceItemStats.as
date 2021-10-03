package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1453:Array;
      
      private var var_1879:int;
      
      private var var_1877:int;
      
      private var var_1881:int;
      
      private var var_1878:int;
      
      private var _dayOffsets:Array;
      
      private var var_1880:int;
      
      private var var_1452:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1453;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1453 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1877;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1452 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1879 = param1;
      }
      
      public function get method_3() : int
      {
         return var_1881;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1878;
      }
      
      public function get offerCount() : int
      {
         return var_1880;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1880 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1452;
      }
      
      public function get averagePrice() : int
      {
         return var_1879;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1878 = param1;
      }
      
      public function set method_3(param1:int) : void
      {
         var_1881 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1877 = param1;
      }
   }
}
