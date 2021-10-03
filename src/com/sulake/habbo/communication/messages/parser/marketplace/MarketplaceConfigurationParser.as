package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1690:int;
      
      private var var_1527:int;
      
      private var var_1692:int;
      
      private var var_1693:int;
      
      private var var_1689:int;
      
      private var var_1528:int;
      
      private var var_1691:int;
      
      private var var_1688:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1690;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1527;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1691;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1693;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1689;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1528;
      }
      
      public function get commission() : int
      {
         return var_1692;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1688 = param1.readBoolean();
         var_1692 = param1.readInteger();
         var_1527 = param1.readInteger();
         var_1528 = param1.readInteger();
         var_1693 = param1.readInteger();
         var_1690 = param1.readInteger();
         var_1689 = param1.readInteger();
         var_1691 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1688;
      }
   }
}
