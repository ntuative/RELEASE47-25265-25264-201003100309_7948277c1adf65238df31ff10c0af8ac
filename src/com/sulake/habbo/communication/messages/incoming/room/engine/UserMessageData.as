package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1149:String = "F";
      
      public static const const_869:String = "M";
       
      
      private var var_85:Number = 0;
      
      private var var_576:String = "";
      
      private var var_1994:int = 0;
      
      private var var_1998:String = "";
      
      private var var_1997:int = 0;
      
      private var var_1928:int = 0;
      
      private var var_1996:String = "";
      
      private var var_1277:String = "";
      
      private var _id:int = 0;
      
      private var var_200:Boolean = false;
      
      private var var_224:int = 0;
      
      private var var_1995:String = "";
      
      private var _name:String = "";
      
      private var var_1940:int = 0;
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_224;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_200)
         {
            var_224 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_200)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1994;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_200)
         {
            var_1997 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1995;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_200)
         {
            var_1996 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_200)
         {
            var_1995 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_200)
         {
            var_1928 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_200)
         {
            var_576 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_200)
         {
            var_1994 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_200)
         {
            var_1277 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1997;
      }
      
      public function get groupID() : String
      {
         return var_1996;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_200)
         {
            var_1940 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_200)
         {
            var_1998 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_200 = true;
      }
      
      public function get sex() : String
      {
         return var_1277;
      }
      
      public function get figure() : String
      {
         return var_576;
      }
      
      public function get webID() : int
      {
         return var_1940;
      }
      
      public function get custom() : String
      {
         return var_1998;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_200)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_200)
         {
            var_86 = param1;
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
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1928;
      }
   }
}
