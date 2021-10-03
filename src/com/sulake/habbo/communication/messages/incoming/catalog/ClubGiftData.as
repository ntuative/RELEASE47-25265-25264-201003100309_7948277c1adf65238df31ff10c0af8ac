package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1978:int;
      
      private var var_1979:Boolean;
      
      private var _offerId:int;
      
      private var var_1980:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1979 = param1.readBoolean();
         var_1978 = param1.readInteger();
         var_1980 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1980;
      }
      
      public function get monthsRequired() : int
      {
         return var_1978;
      }
      
      public function get isVip() : Boolean
      {
         return var_1979;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
