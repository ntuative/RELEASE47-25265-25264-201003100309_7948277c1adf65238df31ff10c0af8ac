package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_1028:int = 0;
      
      private var var_86:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_200:Boolean = false;
      
      private var var_224:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var var_85:Number = 0;
      
      private var var_1029:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_200)
         {
            var_86 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_1028;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get dir() : int
      {
         return var_224;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_200)
         {
            _name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_200)
         {
            var_224 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_200)
         {
            _y = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_200 = true;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_200)
         {
            var_1028 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_200)
         {
            var_1029 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_200)
         {
            var_85 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         if(!var_200)
         {
            _type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1029;
      }
   }
}
