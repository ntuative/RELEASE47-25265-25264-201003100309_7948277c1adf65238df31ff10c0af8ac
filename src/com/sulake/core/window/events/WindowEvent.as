package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_318:String = "WE_CHILD_RESIZED";
      
      public static const const_1355:String = "WE_CLOSE";
      
      public static const const_1342:String = "WE_DESTROY";
      
      public static const const_154:String = "WE_CHANGE";
      
      public static const const_1279:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1503:String = "WE_PARENT_RESIZE";
      
      public static const const_94:String = "WE_UPDATE";
      
      public static const const_1220:String = "WE_MAXIMIZE";
      
      public static const const_426:String = "WE_DESTROYED";
      
      public static const const_828:String = "WE_UNSELECT";
      
      public static const const_1391:String = "WE_MAXIMIZED";
      
      public static const const_1469:String = "WE_UNLOCKED";
      
      public static const const_415:String = "WE_CHILD_REMOVED";
      
      public static const const_177:String = "WE_OK";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1172:String = "WE_ACTIVATE";
      
      public static const const_257:String = "WE_ENABLED";
      
      public static const const_432:String = "WE_CHILD_RELOCATED";
      
      public static const const_1141:String = "WE_CREATE";
      
      public static const const_543:String = "WE_SELECT";
      
      public static const const_160:String = "";
      
      public static const const_1546:String = "WE_LOCKED";
      
      public static const const_1497:String = "WE_PARENT_RELOCATE";
      
      public static const const_1589:String = "WE_CHILD_REMOVE";
      
      public static const const_1507:String = "WE_CHILD_RELOCATE";
      
      public static const const_1447:String = "WE_LOCK";
      
      public static const const_217:String = "WE_FOCUSED";
      
      public static const const_728:String = "WE_UNSELECTED";
      
      public static const const_792:String = "WE_DEACTIVATED";
      
      public static const const_1362:String = "WE_MINIMIZED";
      
      public static const const_1602:String = "WE_ARRANGED";
      
      public static const const_1512:String = "WE_UNLOCK";
      
      public static const const_1611:String = "WE_ATTACH";
      
      public static const const_1377:String = "WE_OPEN";
      
      public static const const_1300:String = "WE_RESTORE";
      
      public static const const_1584:String = "WE_PARENT_RELOCATED";
      
      public static const const_1238:String = "WE_RELOCATE";
      
      public static const const_1521:String = "WE_CHILD_RESIZE";
      
      public static const const_1604:String = "WE_ARRANGE";
      
      public static const const_1285:String = "WE_OPENED";
      
      public static const const_1374:String = "WE_CLOSED";
      
      public static const const_1608:String = "WE_DETACHED";
      
      public static const const_1531:String = "WE_UPDATED";
      
      public static const const_1367:String = "WE_UNFOCUSED";
      
      public static const const_452:String = "WE_RELOCATED";
      
      public static const const_1333:String = "WE_DEACTIVATE";
      
      public static const const_197:String = "WE_DISABLED";
      
      public static const const_603:String = "WE_CANCEL";
      
      public static const const_614:String = "WE_ENABLE";
      
      public static const const_1221:String = "WE_ACTIVATED";
      
      public static const const_1250:String = "WE_FOCUS";
      
      public static const const_1581:String = "WE_DETACH";
      
      public static const const_1283:String = "WE_RESTORED";
      
      public static const const_1311:String = "WE_UNFOCUS";
      
      public static const const_53:String = "WE_SELECTED";
      
      public static const const_1241:String = "WE_PARENT_RESIZED";
      
      public static const const_1290:String = "WE_CREATED";
      
      public static const const_1572:String = "WE_ATTACHED";
      
      public static const const_1162:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1596:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1368:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1596 = param3;
         var_1368 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1368;
      }
      
      public function get related() : IWindow
      {
         return var_1596;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1368 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
