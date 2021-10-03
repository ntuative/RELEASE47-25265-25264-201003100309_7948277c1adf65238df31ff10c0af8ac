package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionFriendRequestEvent extends RoomSessionEvent
   {
      
      public static const const_109:String = "RSFRE_FRIEND_REQUEST";
       
      
      private var _userName:String;
      
      private var var_1025:int = 0;
      
      private var _userId:int = 0;
      
      public function RoomSessionFriendRequestEvent(param1:IRoomSession, param2:int, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_109,param1,param5,param6);
         var_1025 = param2;
         _userId = param3;
         _userName = param4;
      }
      
      public function get requestId() : int
      {
         return var_1025;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
