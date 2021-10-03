package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1647:Boolean = false;
      
      private var var_1648:int = 0;
      
      private var var_1651:int = 0;
      
      private var var_1650:int = 0;
      
      private var var_1479:int = 0;
      
      private var var_1649:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1479 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1648;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1647;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1647 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1648 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1651 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1479;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1650 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1651;
      }
      
      public function get pixelBalance() : int
      {
         return var_1650;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1649 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1649;
      }
   }
}
