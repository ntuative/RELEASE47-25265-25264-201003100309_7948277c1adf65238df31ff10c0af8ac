package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_215:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_215 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_215;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_215 = new RoomSettingsFlatInfo();
         var_215.allowFurniMoving = param1.readInteger() == 1;
         var_215.doorMode = param1.readInteger();
         var_215.id = param1.readInteger();
         var_215.ownerName = param1.readString();
         var_215.type = param1.readString();
         var_215.name = param1.readString();
         var_215.description = param1.readString();
         var_215.showOwnerName = param1.readInteger() == 1;
         var_215.allowTrading = param1.readInteger() == 1;
         var_215.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
