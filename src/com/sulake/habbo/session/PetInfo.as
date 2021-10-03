package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1607:int;
      
      private var var_1603:int;
      
      private var var_1604:int;
      
      private var var_1794:int;
      
      private var _nutrition:int;
      
      private var var_1111:int;
      
      private var var_1798:int;
      
      private var var_1797:int;
      
      private var _energy:int;
      
      private var var_1608:int;
      
      private var var_1795:int;
      
      private var _ownerName:String;
      
      private var var_1602:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1607;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1603 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1607 = param1;
      }
      
      public function get petId() : int
      {
         return var_1111;
      }
      
      public function get experienceMax() : int
      {
         return var_1797;
      }
      
      public function get nutritionMax() : int
      {
         return var_1794;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1798 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1602;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1111 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1795;
      }
      
      public function get respect() : int
      {
         return var_1603;
      }
      
      public function get levelMax() : int
      {
         return var_1798;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1797 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1604 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1794 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1602 = param1;
      }
      
      public function get experience() : int
      {
         return var_1604;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1795 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1608 = param1;
      }
      
      public function get age() : int
      {
         return var_1608;
      }
   }
}
