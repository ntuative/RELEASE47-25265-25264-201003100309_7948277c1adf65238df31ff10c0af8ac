package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionQueueEvent extends RoomSessionEvent
   {
      
      public static const const_377:String = "RSQE_QUEUE_STATUS";
      
      public static const const_813:int = 2;
      
      public static const const_848:String = "c";
      
      public static const const_1327:String = "d";
      
      public static const const_980:int = 1;
       
      
      private var var_1248:Map;
      
      private var _name:String;
      
      private var var_2384:String;
      
      private var var_267:Boolean;
      
      private var _target:int;
      
      public function RoomSessionQueueEvent(param1:IRoomSession, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_377,param1,param5,param6);
         _name = param2;
         _target = param3;
         var_1248 = new Map();
         var_267 = param4;
      }
      
      public function getQueueSize(param1:String) : int
      {
         return var_1248.getValue(param1);
      }
      
      public function get queueTypes() : Array
      {
         return var_1248.getKeys();
      }
      
      public function get queueSetTarget() : int
      {
         return _target;
      }
      
      public function get isActive() : Boolean
      {
         return var_267;
      }
      
      public function get queueSetName() : String
      {
         return _name;
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         var_1248.add(param1,param2);
      }
   }
}
