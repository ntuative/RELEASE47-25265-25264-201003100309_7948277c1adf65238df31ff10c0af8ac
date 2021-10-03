package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1251:int;
      
      private var var_1882:int = -1;
      
      private var var_367:int;
      
      private var var_1879:int;
      
      private var var_1791:int;
      
      private var _offerId:int;
      
      private var var_1252:int;
      
      private var var_1792:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1792 = param2;
         var_1791 = param3;
         var_1251 = param4;
         var_367 = param5;
         var_1882 = param6;
         var_1879 = param7;
         var_1252 = param8;
      }
      
      public function get status() : int
      {
         return var_367;
      }
      
      public function get price() : int
      {
         return var_1251;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1882;
      }
      
      public function get offerCount() : int
      {
         return var_1252;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1791;
      }
      
      public function get averagePrice() : int
      {
         return var_1879;
      }
      
      public function get furniId() : int
      {
         return var_1792;
      }
   }
}
