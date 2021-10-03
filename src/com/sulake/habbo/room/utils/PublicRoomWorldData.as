package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1971:Number = 1;
      
      private var var_198:Number = 1;
      
      private var var_1907:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_1907 = param1;
         var_198 = param2;
         var_1971 = param3;
      }
      
      public function get scale() : Number
      {
         return var_198;
      }
      
      public function get heightScale() : Number
      {
         return var_1971;
      }
   }
}
