package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_1047:String;
      
      private var _id:int;
      
      private var var_1786:String = "";
      
      private var var_1789:int;
      
      private var var_1787:String;
      
      private var var_1788:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1789 = parseInt(param1.@pattern);
         var_1047 = String(param1.@gender);
         var_1788 = Boolean(parseInt(param1.@colorable));
         var_1786 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1786;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1788;
      }
      
      public function get gender() : String
      {
         return var_1047;
      }
      
      public function get patternId() : int
      {
         return var_1789;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1787;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1787 = param1;
      }
   }
}
