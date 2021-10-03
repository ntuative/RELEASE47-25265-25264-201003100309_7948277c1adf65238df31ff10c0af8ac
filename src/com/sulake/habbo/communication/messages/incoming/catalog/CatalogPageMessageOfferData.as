package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_804:Array;
      
      private var var_825:int;
      
      private var var_1199:String;
      
      private var _offerId:int;
      
      private var var_824:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1199 = param1.readString();
         var_825 = param1.readInteger();
         var_824 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_804 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_804.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_804;
      }
      
      public function get priceInCredits() : int
      {
         return var_825;
      }
      
      public function get localizationId() : String
      {
         return var_1199;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_824;
      }
   }
}
