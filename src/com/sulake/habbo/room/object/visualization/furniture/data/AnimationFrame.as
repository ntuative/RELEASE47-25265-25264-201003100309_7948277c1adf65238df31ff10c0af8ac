package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_588:int = -1;
      
      public static const const_820:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1732:int = -1;
      
      private var var_85:int = 0;
      
      private var var_1153:int = 1;
      
      private var var_791:int = 1;
      
      private var var_1733:Boolean = false;
      
      private var var_1734:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_85 = param2;
         _y = param3;
         var_1733 = param5;
         if(param4 < 0)
         {
            param4 = const_588;
         }
         var_791 = param4;
         var_1153 = param4;
         if(param6 >= 0)
         {
            var_1732 = param6;
            var_1734 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_791 > 0 && param1 > var_791)
         {
            param1 = var_791;
         }
         var_1153 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_791;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1734;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_791 < 0)
         {
            return const_588;
         }
         return var_1153;
      }
      
      public function get activeSequence() : int
      {
         return var_1732;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1733;
      }
      
      public function get x() : int
      {
         return var_85;
      }
   }
}
