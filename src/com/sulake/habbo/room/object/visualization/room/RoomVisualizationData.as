package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_560:PlaneMaskManager;
      
      private var var_395:WallRasterizer;
      
      private var var_394:FloorRasterizer;
      
      private var var_773:Boolean = false;
      
      private var _landscapeRasterizer:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_395 = new WallRasterizer();
         var_394 = new FloorRasterizer();
         _landscapeRasterizer = new LandscapeRasterizer();
         var_560 = new PlaneMaskManager();
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_560;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_395;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_394;
      }
      
      protected function reset() : void
      {
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc6_ = _loc2_[0];
            var_395.initialize(_loc6_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc7_ = _loc3_[0];
            var_394.initialize(_loc7_);
         }
         var _loc4_:XMLList = param1.landscapeData;
         if(_loc4_.length() > 0)
         {
            _loc8_ = _loc4_[0];
            _landscapeRasterizer.initialize(_loc8_);
         }
         var _loc5_:XMLList = param1.maskData;
         if(_loc5_.length() > 0)
         {
            _loc9_ = _loc5_[0];
            var_560.initialize(_loc9_);
         }
         return true;
      }
      
      public function get initialized() : Boolean
      {
         return var_773;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return _landscapeRasterizer;
      }
      
      public function clearCache() : void
      {
         if(var_395 != null)
         {
            var_395.clearCache();
         }
         if(var_394 != null)
         {
            var_394.clearCache();
         }
         if(_landscapeRasterizer != null)
         {
            _landscapeRasterizer.clearCache();
         }
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_773)
         {
            return;
         }
         var_395.initializeAssetCollection(param1);
         var_394.initializeAssetCollection(param1);
         _landscapeRasterizer.initializeAssetCollection(param1);
         var_560.initializeAssetCollection(param1);
         var_773 = true;
      }
      
      public function dispose() : void
      {
         if(var_395 != null)
         {
            var_395.dispose();
            var_395 = null;
         }
         if(var_394 != null)
         {
            var_394.dispose();
            var_394 = null;
         }
         if(_landscapeRasterizer != null)
         {
            _landscapeRasterizer.dispose();
            _landscapeRasterizer = null;
         }
         if(var_560 != null)
         {
            var_560.dispose();
            var_560 = null;
         }
      }
   }
}
