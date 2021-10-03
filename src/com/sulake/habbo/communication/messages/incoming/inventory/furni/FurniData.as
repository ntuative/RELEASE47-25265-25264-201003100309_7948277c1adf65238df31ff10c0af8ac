package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1380:String;
      
      private var var_1017:String;
      
      private var var_1975:Boolean;
      
      private var var_1468:int;
      
      private var var_1904:int;
      
      private var var_1976:Boolean;
      
      private var var_1899:String = "";
      
      private var var_1903:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1295:int;
      
      private var var_1901:Boolean;
      
      private var var_1900:int = -1;
      
      private var var_1902:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1904 = param1;
         var_1017 = param2;
         _objId = param3;
         var_1295 = param4;
         _category = param5;
         var_1380 = param6;
         var_1975 = param7;
         var_1903 = param8;
         var_1901 = param9;
         var_1976 = param10;
         var_1902 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1899;
      }
      
      public function get extra() : int
      {
         return var_1468;
      }
      
      public function get classId() : int
      {
         return var_1295;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_1976;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1975;
      }
      
      public function get stripId() : int
      {
         return var_1904;
      }
      
      public function get stuffData() : String
      {
         return var_1380;
      }
      
      public function get songId() : int
      {
         return var_1900;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1899 = param1;
         var_1468 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1017;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1902;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1901;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1903;
      }
   }
}
