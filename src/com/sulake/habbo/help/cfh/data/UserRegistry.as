package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1070:int = 80;
       
      
      private var var_478:Map;
      
      private var var_668:String = "";
      
      private var var_1191:Array;
      
      public function UserRegistry()
      {
         var_478 = new Map();
         var_1191 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_478.getValue(var_1191.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_668;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_478.getValue(param1) != null)
         {
            var_478.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_668);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_668 == "")
         {
            var_1191.push(param1);
         }
         var_478.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_478;
      }
      
      public function unregisterRoom() : void
      {
         var_668 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_478.length > const_1070)
         {
            _loc1_ = var_478.getKey(0);
            var_478.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_668 = param1;
         if(var_668 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
