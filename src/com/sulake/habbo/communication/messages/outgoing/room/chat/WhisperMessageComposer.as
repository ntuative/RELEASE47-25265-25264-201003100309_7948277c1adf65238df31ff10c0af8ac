package com.sulake.habbo.communication.messages.outgoing.room.chat
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class WhisperMessageComposer implements IMessageComposer
   {
       
      
      private var var_1656:String;
      
      private var _roomCategory:int = 0;
      
      private var var_192:String;
      
      private var _roomId:int = 0;
      
      public function WhisperMessageComposer(param1:String, param2:String, param3:int = 0, param4:int = 0)
      {
         super();
         var_1656 = param1;
         var_192 = param2;
         _roomId = param3;
         _roomCategory = param4;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:String = var_1656 + " " + var_192;
         return [_loc1_];
      }
      
      public function dispose() : void
      {
      }
   }
}
