package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1043:int = 0;
      
      private var var_1170:int = 0;
      
      private var var_1801:String = "";
      
      private var var_1042:int = 0;
      
      private var var_1806:String = "";
      
      private var var_1805:int = 0;
      
      private var var_1515:String = "";
      
      private var var_1804:int = 0;
      
      private var var_1802:int = 0;
      
      private var var_1807:String = "";
      
      private var var_1803:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1804 = param1;
         var_1807 = param2;
         var_1515 = param3;
         var_1801 = param4;
         var_1806 = param5;
         if(param6)
         {
            var_1170 = 1;
         }
         else
         {
            var_1170 = 0;
         }
         var_1805 = param7;
         var_1802 = param8;
         var_1042 = param9;
         var_1803 = param10;
         var_1043 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1804,var_1807,var_1515,var_1801,var_1806,var_1170,var_1805,var_1802,var_1042,var_1803,var_1043];
      }
      
      public function dispose() : void
      {
      }
   }
}
