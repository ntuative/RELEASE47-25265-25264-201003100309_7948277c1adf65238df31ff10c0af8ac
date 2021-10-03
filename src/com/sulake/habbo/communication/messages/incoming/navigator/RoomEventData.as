package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2058:String;
      
      private var var_405:int;
      
      private var var_2054:String;
      
      private var var_2055:String;
      
      private var var_2056:int;
      
      private var var_2057:String;
      
      private var var_2053:int;
      
      private var var_624:Array;
      
      private var var_975:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_624 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_975 = false;
            return;
         }
         this.var_975 = true;
         var_2056 = int(_loc2_);
         var_2054 = param1.readString();
         var_405 = int(param1.readString());
         var_2053 = param1.readInteger();
         var_2058 = param1.readString();
         var_2055 = param1.readString();
         var_2057 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_624.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2053;
      }
      
      public function get eventName() : String
      {
         return var_2058;
      }
      
      public function get eventDescription() : String
      {
         return var_2055;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2054;
      }
      
      public function get tags() : Array
      {
         return var_624;
      }
      
      public function get creationTime() : String
      {
         return var_2057;
      }
      
      public function get exists() : Boolean
      {
         return var_975;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2056;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get flatId() : int
      {
         return var_405;
      }
   }
}
