package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_591:int = 2;
      
      public static const const_958:int = 6;
      
      public static const const_608:int = 1;
      
      public static const const_534:int = 3;
      
      public static const const_920:int = 4;
      
      public static const const_648:int = 5;
       
      
      private var var_2028:String;
      
      private var var_1088:int;
      
      private var var_1922:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1088 = param2;
         var_1922 = param3;
         var_2028 = param4;
      }
      
      public function get time() : String
      {
         return var_2028;
      }
      
      public function get senderId() : int
      {
         return var_1088;
      }
      
      public function get messageText() : String
      {
         return var_1922;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
