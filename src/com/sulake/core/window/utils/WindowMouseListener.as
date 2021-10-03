package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.MouseListenerType;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class WindowMouseListener extends WindowMouseOperator implements IWindowMouseListenerService
   {
       
      
      private var var_888:uint;
      
      private var var_1057:Array;
      
      public function WindowMouseListener(param1:DisplayObject)
      {
         var_1057 = new Array();
         var_888 = MouseListenerType.const_1324;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         var _loc2_:int = 0;
         while(_loc2_ > 0)
         {
            var_1057.pop();
            _loc2_--;
         }
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
      }
      
      override protected function handler(param1:Event) : void
      {
         var _loc2_:Boolean = false;
         if(_working && true)
         {
            if(var_1057.indexOf(param1.type) >= 0)
            {
               if(param1 is MouseEvent)
               {
                  _loc2_ = _window.hitTestGlobalPoint(new Point(MouseEvent(param1).stageX,MouseEvent(param1).stageY));
                  if(var_888 == MouseListenerType.const_1302 && !_loc2_)
                  {
                     return;
                  }
                  if(var_888 == MouseListenerType.const_965 && _loc2_)
                  {
                     return;
                  }
               }
               _window.update(null,param1);
            }
         }
      }
      
      public function set areaLimit(param1:uint) : void
      {
         var_888 = param1;
      }
      
      public function get areaLimit() : uint
      {
         return var_888;
      }
      
      public function get eventTypes() : Array
      {
         return var_1057;
      }
   }
}
