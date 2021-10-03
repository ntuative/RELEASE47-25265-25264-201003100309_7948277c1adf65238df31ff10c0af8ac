package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_944:Boolean;
      
      private var _name:String;
      
      private var var_2042:String;
      
      private var var_943:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2042 = String(param1.@link);
         var_943 = Boolean(parseInt(param1.@fliph));
         var_944 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_943;
      }
      
      public function get flipV() : Boolean
      {
         return var_944;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2042;
      }
   }
}
