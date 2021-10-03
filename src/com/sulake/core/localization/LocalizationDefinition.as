package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1387:String;
      
      private var var_928:String;
      
      private var var_1388:String;
      
      private var var_1386:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1386 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1387 = _loc5_[0];
         var_1388 = _loc5_[1];
         _name = param2;
         var_928 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1387;
      }
      
      public function get languageCode() : String
      {
         return var_1386;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_928;
      }
      
      public function get encoding() : String
      {
         return var_1388;
      }
      
      public function get id() : String
      {
         return var_1386 + "_" + var_1387 + "." + var_1388;
      }
   }
}
