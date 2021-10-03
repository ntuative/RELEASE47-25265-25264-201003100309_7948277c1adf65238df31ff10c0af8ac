package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2272:Boolean;
      
      protected var var_1468:Number;
      
      protected var var_2269:Boolean;
      
      protected var _type:int;
      
      protected var var_2271:Boolean;
      
      protected var var_1900:int;
      
      protected var var_2268:Boolean;
      
      protected var var_1380:String;
      
      protected var var_1894:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1899:String;
      
      protected var var_1893:Boolean;
      
      protected var _category:int;
      
      protected var var_1897:int;
      
      protected var var_2270:int;
      
      protected var var_1890:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_1893 = param5;
         var_2268 = param6;
         var_2272 = param7;
         var_2269 = param8;
         var_1380 = param9;
         var_1468 = param10;
         var_2270 = param11;
         var_1890 = param12;
         var_1897 = param13;
         var_1894 = param14;
         var_1899 = param15;
         var_1900 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2271;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1468;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2271 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1900;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2269;
      }
      
      public function get slotId() : String
      {
         return var_1899;
      }
      
      public function get expires() : int
      {
         return var_2270;
      }
      
      public function get creationYear() : int
      {
         return var_1894;
      }
      
      public function get creationDay() : int
      {
         return var_1890;
      }
      
      public function get stuffData() : String
      {
         return var_1380;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2268;
      }
      
      public function get groupable() : Boolean
      {
         return var_1893;
      }
      
      public function get creationMonth() : int
      {
         return var_1897;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2272;
      }
   }
}
