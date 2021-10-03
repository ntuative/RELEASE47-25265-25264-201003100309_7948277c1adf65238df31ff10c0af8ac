package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1883:int;
      
      private var var_2069:String;
      
      private var var_2065:int;
      
      private var var_2066:int;
      
      private var var_727:Boolean;
      
      private var var_1779:Boolean;
      
      private var var_405:int;
      
      private var var_1115:String;
      
      private var var_1778:int;
      
      private var var_1271:int;
      
      private var _ownerName:String;
      
      private var var_668:String;
      
      private var var_2067:int;
      
      private var var_2070:RoomThumbnailData;
      
      private var var_2068:Boolean;
      
      private var var_624:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_624 = new Array();
         super();
         var_405 = param1.readInteger();
         var_727 = param1.readBoolean();
         var_668 = param1.readString();
         _ownerName = param1.readString();
         var_1778 = param1.readInteger();
         var_1883 = param1.readInteger();
         var_2067 = param1.readInteger();
         var_1115 = param1.readString();
         var_2065 = param1.readInteger();
         var_2068 = param1.readBoolean();
         var_2066 = param1.readInteger();
         var_1271 = param1.readInteger();
         var_2069 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_624.push(_loc4_);
            _loc3_++;
         }
         var_2070 = new RoomThumbnailData(param1);
         var_1779 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2067;
      }
      
      public function get roomName() : String
      {
         return var_668;
      }
      
      public function get userCount() : int
      {
         return var_1883;
      }
      
      public function get score() : int
      {
         return var_2066;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2069;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2068;
      }
      
      public function get tags() : Array
      {
         return var_624;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1779;
      }
      
      public function get event() : Boolean
      {
         return var_727;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_624 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1271;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2065;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2070;
      }
      
      public function get doorMode() : int
      {
         return var_1778;
      }
      
      public function get flatId() : int
      {
         return var_405;
      }
      
      public function get description() : String
      {
         return var_1115;
      }
   }
}
