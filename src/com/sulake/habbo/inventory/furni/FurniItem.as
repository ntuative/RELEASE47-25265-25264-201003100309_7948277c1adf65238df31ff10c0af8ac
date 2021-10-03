package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1904:int;
      
      private var var_1903:Boolean;
      
      private var var_1900:int;
      
      private var var_1380:String;
      
      private var var_1898:Boolean = false;
      
      private var var_1902:int;
      
      private var var_445:int;
      
      private var var_1017:String;
      
      private var var_1899:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1295:int;
      
      private var var_1901:Boolean;
      
      private var var_1905:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1904 = param1;
         var_1017 = param2;
         _objId = param3;
         var_1295 = param4;
         var_1380 = param5;
         var_1903 = param6;
         var_1901 = param7;
         var_1902 = param8;
         var_1899 = param9;
         var_1900 = param10;
         var_445 = -1;
      }
      
      public function get songId() : int
      {
         return var_1900;
      }
      
      public function get iconCallbackId() : int
      {
         return var_445;
      }
      
      public function get expiryTime() : int
      {
         return var_1902;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1905 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1898 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_445 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1901;
      }
      
      public function get slotId() : String
      {
         return var_1899;
      }
      
      public function get classId() : int
      {
         return var_1295;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1903;
      }
      
      public function get stuffData() : String
      {
         return var_1380;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1904;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1898;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1905;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1017;
      }
   }
}
