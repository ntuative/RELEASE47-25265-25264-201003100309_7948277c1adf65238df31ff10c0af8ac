package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1608:int;
      
      private var var_576:String;
      
      private var var_1607:int;
      
      private var var_1603:int;
      
      private var var_1604:int;
      
      private var var_1606:int;
      
      private var _nutrition:int;
      
      private var var_1111:int;
      
      private var var_1600:int;
      
      private var var_1601:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1602:int;
      
      private var var_1605:int;
      
      public function PetInfoMessageParser()
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
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1606;
      }
      
      public function flush() : Boolean
      {
         var_1111 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1600;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1601;
      }
      
      public function get maxNutrition() : int
      {
         return var_1605;
      }
      
      public function get figure() : String
      {
         return var_576;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1603;
      }
      
      public function get petId() : int
      {
         return var_1111;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1111 = param1.readInteger();
         _name = param1.readString();
         var_1607 = param1.readInteger();
         var_1600 = param1.readInteger();
         var_1604 = param1.readInteger();
         var_1601 = param1.readInteger();
         _energy = param1.readInteger();
         var_1606 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1605 = param1.readInteger();
         var_576 = param1.readString();
         var_1603 = param1.readInteger();
         var_1602 = param1.readInteger();
         var_1608 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1604;
      }
      
      public function get ownerId() : int
      {
         return var_1602;
      }
      
      public function get age() : int
      {
         return var_1608;
      }
   }
}
