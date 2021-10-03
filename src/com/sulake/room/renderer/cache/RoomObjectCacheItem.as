package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_612:RoomObjectLocationCacheItem = null;
      
      private var var_166:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_612 = new RoomObjectLocationCacheItem(param1);
         var_166 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_612;
      }
      
      public function dispose() : void
      {
         if(var_612 != null)
         {
            var_612.dispose();
            var_612 = null;
         }
         if(var_166 != null)
         {
            var_166.dispose();
            var_166 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_166;
      }
   }
}
