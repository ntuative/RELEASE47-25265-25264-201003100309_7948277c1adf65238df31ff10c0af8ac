package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_113:String = "RSPE_VOTE_RESULT";
      
      public static const const_128:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1328:int = 0;
      
      private var var_998:String = "";
      
      private var var_720:Array;
      
      private var var_954:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_954 = [];
         var_720 = [];
         super(param1,param2,param7,param8);
         var_998 = param3;
         var_954 = param4;
         var_720 = param5;
         if(var_720 == null)
         {
            var_720 = [];
         }
         var_1328 = param6;
      }
      
      public function get votes() : Array
      {
         return var_720.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1328;
      }
      
      public function get question() : String
      {
         return var_998;
      }
      
      public function get choices() : Array
      {
         return var_954.slice();
      }
   }
}
