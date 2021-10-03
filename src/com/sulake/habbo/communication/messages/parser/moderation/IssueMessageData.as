package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_143:int = 1;
      
      public static const const_1314:int = 3;
      
      public static const const_422:int = 2;
       
      
      private var var_2206:int;
      
      private var var_2101:int;
      
      private var var_2210:int;
      
      private var var_1946:int;
      
      private var var_36:int;
      
      private var var_405:int;
      
      private var var_1358:int;
      
      private var var_1842:int;
      
      private var var_1018:int;
      
      private var _roomResources:String;
      
      private var var_1630:int;
      
      private var var_2207:int;
      
      private var var_2209:String;
      
      private var var_1843:String;
      
      private var var_2208:int = 0;
      
      private var var_1234:String;
      
      private var _message:String;
      
      private var var_1683:int;
      
      private var var_2211:String;
      
      private var var_1271:int;
      
      private var var_668:String;
      
      private var var_2205:String;
      
      private var var_1561:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1018 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2208 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2207;
      }
      
      public function set roomName(param1:String) : void
      {
         var_668 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1630 = param1;
      }
      
      public function get state() : int
      {
         return var_36;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_668;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1946 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_36 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_2101;
      }
      
      public function get priority() : int
      {
         return var_2206 + var_2208;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1842 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1843;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1561) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1271;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2207 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1358;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2209 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1630;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1946;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2205 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1234 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1842;
      }
      
      public function set priority(param1:int) : void
      {
         var_2206 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_2101 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2209;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2210 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1843 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1683 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1234;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1358 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2210;
      }
      
      public function set flatId(param1:int) : void
      {
         var_405 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1271 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1561 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1683;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2211 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1561;
      }
      
      public function get reportedUserId() : int
      {
         return var_1018;
      }
      
      public function get flatId() : int
      {
         return var_405;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2205;
      }
      
      public function get reporterUserName() : String
      {
         return var_2211;
      }
   }
}
