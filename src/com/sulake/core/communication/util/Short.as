package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_661:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_661 = new ByteArray();
         var_661.writeShort(param1);
         var_661.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_661.position = 0;
         if(false)
         {
            _loc1_ = var_661.readShort();
            var_661.position = 0;
         }
         return _loc1_;
      }
   }
}
