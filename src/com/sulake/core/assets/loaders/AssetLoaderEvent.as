package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_858:String = "AssetLoaderEventUnload";
      
      public static const const_44:String = "AssetLoaderEventError";
      
      public static const const_816:String = "AssetLoaderEventOpen";
      
      public static const const_862:String = "AssetLoaderEventProgress";
      
      public static const const_1019:String = "AssetLoaderEventStatus";
      
      public static const const_32:String = "AssetLoaderEventComplete";
       
      
      private var var_367:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_367 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_367;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_367);
      }
   }
}
