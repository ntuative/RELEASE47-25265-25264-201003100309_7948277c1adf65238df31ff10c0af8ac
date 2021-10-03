package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1533:int = 2;
      
      public static const const_1495:int = 1;
      
      public static const const_1515:int = 0;
       
      
      private var var_1251:int;
      
      private var var_367:int;
      
      private var var_2362:int;
      
      private var _offerId:int;
      
      private var var_1791:int;
      
      private var var_1792:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_1792 = param2;
         var_1791 = param3;
         var_1251 = param4;
      }
      
      public function get furniId() : int
      {
         return var_1792;
      }
      
      public function get furniType() : int
      {
         return var_1791;
      }
      
      public function get price() : int
      {
         return var_1251;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
