package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1900:int;
      
      private var var_1969:int = 0;
      
      private var var_1970:String;
      
      private var var_1967:int;
      
      private var var_1968:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1900 = param1;
         var_1967 = param2;
         var_1968 = param3;
         var_1970 = param4;
      }
      
      public function get length() : int
      {
         return var_1967;
      }
      
      public function get name() : String
      {
         return var_1968;
      }
      
      public function get creator() : String
      {
         return var_1970;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1969;
      }
      
      public function get id() : int
      {
         return var_1900;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1969 = param1;
      }
   }
}
