package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_86:Number = 0;
      
      private var _data:String = "";
      
      private var var_1468:int = 0;
      
      private var var_36:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1727:Boolean = false;
      
      private var var_2359:String = "";
      
      private var _id:int = 0;
      
      private var var_200:Boolean = false;
      
      private var var_224:String = "";
      
      private var var_1726:int = 0;
      
      private var var_1730:int = 0;
      
      private var var_1729:int = 0;
      
      private var var_1728:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1727 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_200)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1727;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_200)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_224;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_200)
         {
            var_1729 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_200)
         {
            var_1726 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_200)
         {
            var_1730 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_200)
         {
            var_224 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_200)
         {
            var_1728 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_200)
         {
            var_36 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1729;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_200)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1726;
      }
      
      public function get wallY() : Number
      {
         return var_1730;
      }
      
      public function get localY() : Number
      {
         return var_1728;
      }
      
      public function setReadOnly() : void
      {
         var_200 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_200)
         {
            var_86 = param1;
         }
      }
   }
}
