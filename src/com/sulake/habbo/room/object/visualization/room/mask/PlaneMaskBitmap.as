package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_49:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1;
      
      private var var_2128:Number = -1;
      
      private var var_857:IGraphicAsset = null;
      
      private var var_2129:Number = 1;
      
      private var var_2127:Number = -1;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1, param3:Number = 1, param4:Number = -1, param5:Number = 1)
      {
         super();
         var_2128 = param2;
         _normalMaxX = param3;
         var_2127 = param4;
         var_2129 = param5;
         var_857 = param1;
      }
      
      public function get normalMaxY() : Number
      {
         return var_2129;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMinX() : Number
      {
         return var_2128;
      }
      
      public function get normalMinY() : Number
      {
         return var_2127;
      }
      
      public function get asset() : IGraphicAsset
      {
         return var_857;
      }
      
      public function dispose() : void
      {
         var_857 = null;
      }
   }
}
