package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1209:int = 4;
      
      public static const const_600:int = 3;
      
      public static const const_671:int = 2;
      
      public static const const_878:int = 1;
       
      
      private var var_2199:String;
      
      private var _disposed:Boolean;
      
      private var var_1883:int;
      
      private var var_2196:Boolean;
      
      private var var_784:String;
      
      private var var_903:PublicRoomData;
      
      private var var_2200:int;
      
      private var _index:int;
      
      private var var_2197:String;
      
      private var _type:int;
      
      private var var_1616:String;
      
      private var var_904:GuestRoomData;
      
      private var var_2198:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2199 = param1.readString();
         var_2198 = param1.readString();
         var_2196 = param1.readInteger() == 1;
         var_2197 = param1.readString();
         var_784 = param1.readString();
         var_2200 = param1.readInteger();
         var_1883 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_878)
         {
            var_1616 = param1.readString();
         }
         else if(_type == const_600)
         {
            var_903 = new PublicRoomData(param1);
         }
         else if(_type == const_671)
         {
            var_904 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2200;
      }
      
      public function get popupCaption() : String
      {
         return var_2199;
      }
      
      public function get userCount() : int
      {
         return var_1883;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2196;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_878)
         {
            return 0;
         }
         if(this.type == const_671)
         {
            return this.var_904.maxUserCount;
         }
         if(this.type == const_600)
         {
            return this.var_903.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2198;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_904 != null)
         {
            this.var_904.dispose();
            this.var_904 = null;
         }
         if(this.var_903 != null)
         {
            this.var_903.dispose();
            this.var_903 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_904;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2197;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_903;
      }
      
      public function get picRef() : String
      {
         return var_784;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1616;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
