package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1453:Array;
      
      private var var_1879:int;
      
      private var var_1877:int;
      
      private var var_1878:int;
      
      private var var_1881:int;
      
      private var _dayOffsets:Array;
      
      private var var_1880:int;
      
      private var var_1452:Array;
      
      public function MarketplaceItemStatsParser()
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
      
      public function get furniTypeId() : int
      {
         return var_1877;
      }
      
      public function get method_3() : int
      {
         return var_1881;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1878;
      }
      
      public function get offerCount() : int
      {
         return var_1880;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1452;
      }
      
      public function get averagePrice() : int
      {
         return var_1879;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1879 = param1.readInteger();
         var_1880 = param1.readInteger();
         var_1881 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1453 = [];
         var_1452 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1453.push(param1.readInteger());
            var_1452.push(param1.readInteger());
            _loc3_++;
         }
         var_1878 = param1.readInteger();
         var_1877 = param1.readInteger();
         return true;
      }
   }
}
