package com.sulake.room.renderer.cache
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.renderer.utils.ExtendedBitmapData;
   import flash.display.BitmapData;
   
   public class BitmapDataCache
   {
       
      
      private var var_2188:int = 0;
      
      private var var_521:int = 0;
      
      private var var_360:Array;
      
      private var var_359:Map;
      
      public function BitmapDataCache(param1:uint)
      {
         super();
         var_359 = new Map();
         var_360 = [];
         var_2188 = param1;
      }
      
      public function addBitmapData(param1:String, param2:ExtendedBitmapData) : void
      {
         var _loc4_:* = null;
         if(param2 == null)
         {
            return;
         }
         var _loc3_:BitmapDataCacheItem = var_359.getValue(param1) as BitmapDataCacheItem;
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.bitmapData;
            if(_loc4_ != null)
            {
               var_521 -= _loc4_.width * _loc4_.height * 4;
            }
            _loc3_.bitmapData = param2;
         }
         else
         {
            _loc3_ = new BitmapDataCacheItem(param2,param1);
            var_359.add(param1,_loc3_);
            var_360.push(_loc3_);
         }
         var_521 += param2.width * param2.height * 4;
      }
      
      public function compress() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(memUsage > memLimit)
         {
            var_360.sortOn("useCount",0 | 0);
            _loc2_ = -1;
            while(_loc2_ >= 0)
            {
               _loc1_ = var_360[_loc2_] as BitmapDataCacheItem;
               if(_loc1_.useCount > 1)
               {
                  _loc2_++;
               }
               removeItem(_loc1_);
               _loc2_--;
            }
            var_360.splice(_loc2_,0 - _loc2_);
            if(memUsage > memLimit)
            {
               var_360.sortOn("memUsage",Array.NUMERIC);
               while(memUsage > memLimit)
               {
                  _loc1_ = var_360.pop() as BitmapDataCacheItem;
                  if(_loc1_ == null)
                  {
                     break;
                  }
                  removeItem(_loc1_);
               }
            }
         }
      }
      
      public function get memUsage() : int
      {
         return var_521;
      }
      
      public function get memLimit() : int
      {
         return var_2188;
      }
      
      public function getBitmapData(param1:String) : ExtendedBitmapData
      {
         var _loc2_:BitmapDataCacheItem = var_359.getValue(param1) as BitmapDataCacheItem;
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.bitmapData;
      }
      
      private function removeItem(param1:BitmapDataCacheItem) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1 = var_359.remove(param1.name) as BitmapDataCacheItem;
         if(param1 != null)
         {
            var_521 -= param1.memUsage;
            param1.dispose();
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_359 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_359.length)
            {
               _loc2_ = var_359.getWithIndex(_loc1_) as BitmapDataCacheItem;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            var_359.dispose();
            var_359 = null;
         }
         var_360 = null;
      }
   }
}
