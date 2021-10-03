package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1651:int = 0;
      
      private var var_2131:int = 0;
      
      private var var_2132:int = 0;
      
      private var var_1649:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_2131;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2131 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1651 = param1;
      }
      
      public function get credits() : int
      {
         return var_2132;
      }
      
      public function get clubDays() : int
      {
         return var_1651;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1649 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2132 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1649;
      }
   }
}
