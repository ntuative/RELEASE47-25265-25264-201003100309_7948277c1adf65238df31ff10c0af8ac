package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1055:int = 31;
      
      private static const const_1054:int = 32;
      
      private static const const_490:int = 30;
      
      private static const const_749:int = 20;
      
      private static const const_489:int = 10;
       
      
      private var var_604:Boolean = false;
      
      private var var_223:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_223 = new Array();
         super();
         super.setAnimation(const_490);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_604 = true;
            var_223 = new Array();
            var_223.push(const_1055);
            var_223.push(const_1054);
            return;
         }
         if(param1 > 0 && param1 <= const_489)
         {
            if(var_604)
            {
               var_604 = false;
               var_223 = new Array();
               if(_direction == 2)
               {
                  var_223.push(const_749 + 5 - param1);
                  var_223.push(const_489 + 5 - param1);
               }
               else
               {
                  var_223.push(const_749 + param1);
                  var_223.push(const_489 + param1);
               }
               var_223.push(const_490);
               return;
            }
            super.setAnimation(const_490);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
