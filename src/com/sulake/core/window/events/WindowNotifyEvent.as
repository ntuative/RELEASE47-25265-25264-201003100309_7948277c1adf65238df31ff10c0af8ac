package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1168:String = "WN_CREATED";
      
      public static const const_870:String = "WN_DISABLE";
      
      public static const const_927:String = "WN_DEACTIVATED";
      
      public static const const_1006:String = "WN_OPENED";
      
      public static const const_888:String = "WN_CLOSED";
      
      public static const const_845:String = "WN_DESTROY";
      
      public static const const_1576:String = "WN_ARRANGED";
      
      public static const const_421:String = "WN_PARENT_RESIZED";
      
      public static const const_952:String = "WN_ENABLE";
      
      public static const const_992:String = "WN_RELOCATE";
      
      public static const const_887:String = "WN_FOCUS";
      
      public static const const_1016:String = "WN_PARENT_RELOCATED";
      
      public static const const_369:String = "WN_PARAM_UPDATED";
      
      public static const const_635:String = "WN_PARENT_ACTIVATED";
      
      public static const const_193:String = "WN_RESIZED";
      
      public static const const_914:String = "WN_CLOSE";
      
      public static const const_909:String = "WN_PARENT_REMOVED";
      
      public static const const_248:String = "WN_CHILD_RELOCATED";
      
      public static const const_542:String = "WN_ENABLED";
      
      public static const const_272:String = "WN_CHILD_RESIZED";
      
      public static const const_947:String = "WN_MINIMIZED";
      
      public static const const_527:String = "WN_DISABLED";
      
      public static const const_220:String = "WN_CHILD_ACTIVATED";
      
      public static const const_440:String = "WN_STATE_UPDATED";
      
      public static const const_547:String = "WN_UNSELECTED";
      
      public static const const_400:String = "WN_STYLE_UPDATED";
      
      public static const const_1539:String = "WN_UPDATE";
      
      public static const const_391:String = "WN_PARENT_ADDED";
      
      public static const const_551:String = "WN_RESIZE";
      
      public static const const_721:String = "WN_CHILD_REMOVED";
      
      public static const const_1502:String = "";
      
      public static const const_886:String = "WN_RESTORED";
      
      public static const const_320:String = "WN_SELECTED";
      
      public static const const_850:String = "WN_MINIMIZE";
      
      public static const const_1017:String = "WN_FOCUSED";
      
      public static const const_1344:String = "WN_LOCK";
      
      public static const const_327:String = "WN_CHILD_ADDED";
      
      public static const const_938:String = "WN_UNFOCUSED";
      
      public static const const_352:String = "WN_RELOCATED";
      
      public static const const_973:String = "WN_DEACTIVATE";
      
      public static const const_1294:String = "WN_CRETAE";
      
      public static const const_934:String = "WN_RESTORE";
      
      public static const const_301:String = "WN_ACTVATED";
      
      public static const const_1179:String = "WN_LOCKED";
      
      public static const const_476:String = "WN_SELECT";
      
      public static const const_930:String = "WN_MAXIMIZE";
      
      public static const const_854:String = "WN_OPEN";
      
      public static const const_554:String = "WN_UNSELECT";
      
      public static const const_1578:String = "WN_ARRANGE";
      
      public static const const_1370:String = "WN_UNLOCKED";
      
      public static const const_1477:String = "WN_UPDATED";
      
      public static const const_969:String = "WN_ACTIVATE";
      
      public static const const_1256:String = "WN_UNLOCK";
      
      public static const const_941:String = "WN_MAXIMIZED";
      
      public static const const_819:String = "WN_DESTROYED";
      
      public static const const_917:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1596,cancelable);
      }
   }
}
