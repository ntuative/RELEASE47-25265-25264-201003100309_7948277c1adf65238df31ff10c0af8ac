package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_1781:int;
      
      private var var_1778:int;
      
      private var var_1780:Boolean;
      
      private var var_1777:Boolean;
      
      private var var_1782:Array;
      
      private var var_1779:Boolean;
      
      private var var_1271:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_624:Array;
      
      private var var_1115:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_1778;
      }
      
      public function get description() : String
      {
         return var_1115;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1777;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1781;
      }
      
      public function set description(param1:String) : void
      {
         var_1115 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1779 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1781 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1271;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1782;
      }
      
      public function get tags() : Array
      {
         return var_624;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1779;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1778 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1780 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_624 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1782 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1271 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1780;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1777 = param1;
      }
   }
}
