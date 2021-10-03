package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1442:int = 9;
      
      public static const const_1472:int = 4;
      
      public static const const_1459:int = 1;
      
      public static const const_1394:int = 10;
      
      public static const const_1475:int = 2;
      
      public static const const_1197:int = 7;
      
      public static const const_1389:int = 11;
      
      public static const const_1525:int = 3;
      
      public static const const_1175:int = 8;
      
      public static const const_1268:int = 5;
      
      public static const const_1563:int = 6;
      
      public static const const_1230:int = 12;
       
      
      private var var_2237:String;
      
      private var _roomId:int;
      
      private var var_1151:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2237;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1151 = param1.readInteger();
         var_2237 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1151;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
