package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1859:int;
      
      private var var_404:Boolean;
      
      private var var_1858:Boolean;
      
      private var var_816:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1858 = param1.readBoolean();
         if(var_1858)
         {
            var_1859 = param1.readInteger();
            var_404 = param1.readBoolean();
         }
         else
         {
            var_816 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_816 != null)
         {
            var_816.dispose();
            var_816 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1859;
      }
      
      public function get owner() : Boolean
      {
         return var_404;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1858;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_816;
      }
   }
}
