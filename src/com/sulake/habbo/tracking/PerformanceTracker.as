package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1514:GarbageMonitor = null;
      
      private var var_1275:int = 0;
      
      private var var_1170:Boolean = false;
      
      private var var_1801:String = "";
      
      private var var_1515:String = "";
      
      private var var_352:Number = 0;
      
      private var var_1273:int = 10;
      
      private var var_2319:Array;
      
      private var var_627:int = 0;
      
      private var var_1272:int = 60;
      
      private var var_1043:int = 0;
      
      private var var_1042:int = 0;
      
      private var var_1806:String = "";
      
      private var var_2059:Number = 0;
      
      private var var_1274:int = 1000;
      
      private var var_2060:Boolean = true;
      
      private var var_2061:Number = 0.15;
      
      private var var_161:IHabboConfigurationManager = null;
      
      private var var_1807:String = "";
      
      private var var_1276:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2319 = [];
         super();
         var_1515 = Capabilities.version;
         var_1801 = Capabilities.os;
         var_1170 = Capabilities.isDebugger;
         var_1807 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1514 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1275 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1514.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1514.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_352;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1272 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1515;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1042;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1274)
         {
            ++var_1043;
            _loc3_ = true;
         }
         else
         {
            ++var_627;
            if(var_627 <= 1)
            {
               var_352 = param1;
            }
            else
            {
               _loc4_ = Number(var_627);
               var_352 = var_352 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1275 > var_1272 * 1000 && var_1276 < var_1273)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_352);
            _loc5_ = true;
            if(var_2060 && var_1276 > 0)
            {
               _loc6_ = differenceInPercents(var_2059,var_352);
               if(_loc6_ < var_2061)
               {
                  _loc5_ = false;
               }
            }
            var_1275 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2059 = var_352;
               if(sendReport())
               {
                  ++var_1276;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1273 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1274 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1807,var_1515,var_1801,var_1806,var_1170,_loc4_,_loc3_,var_1042,var_352,var_1043);
            _connection.send(_loc1_);
            var_1042 = 0;
            var_352 = 0;
            var_627 = 0;
            var_1043 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_161 = param1;
         var_1272 = int(var_161.getKey("performancetest.interval","60"));
         var_1274 = int(var_161.getKey("performancetest.slowupdatelimit","1000"));
         var_1273 = int(var_161.getKey("performancetest.reportlimit","10"));
         var_2061 = Number(var_161.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2060 = Boolean(int(var_161.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
