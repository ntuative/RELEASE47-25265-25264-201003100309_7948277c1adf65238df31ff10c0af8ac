package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1094:int = 1;
      
      private static const const_1054:int = 3;
      
      private static const const_1095:int = 2;
      
      private static const const_1096:int = 15;
       
      
      private var var_849:int;
      
      private var var_223:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_223 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1095)
         {
            var_223 = new Array();
            var_223.push(const_1094);
            var_849 = const_1096;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_849 > 0)
         {
            --var_849;
         }
         if(var_849 == 0)
         {
            if(false)
            {
               super.setAnimation(var_223.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
