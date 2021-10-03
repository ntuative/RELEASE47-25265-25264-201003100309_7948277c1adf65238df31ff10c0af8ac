package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_325:Timer;
      
      protected var var_936:String;
      
      protected var var_935:uint;
      
      protected var var_1105:Point;
      
      protected var var_243:IToolTipWindow;
      
      protected var var_1104:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1105 = new Point();
         var_1104 = new Point(20,20);
         var_935 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_325 != null)
         {
            var_325.stop();
            var_325.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_325 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1105);
            if(var_243 != null && true)
            {
               var_243.x = param1 + var_1104.x;
               var_243.y = param2 + var_1104.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_325 != null)
         {
            var_325.reset();
         }
         if(_window && true)
         {
            if(var_243 == null || false)
            {
               var_243 = _window.context.create("undefined::ToolTip",var_936,WindowType.const_323,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_243.x = _loc2_.x + var_1105.x + var_1104.x;
            var_243.y = _loc2_.y + var_1105.y + var_1104.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_936 = IInteractiveWindow(param1).toolTipCaption;
               var_935 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_936 = param1.caption;
               var_935 = 500;
            }
            _mouse.x = var_120.mouseX;
            _mouse.y = var_120.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1105);
            if(var_936 != null && var_936 != "")
            {
               if(var_325 == null)
               {
                  var_325 = new Timer(var_935,1);
                  var_325.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_325.reset();
               var_325.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_243 != null && true)
         {
            var_243.destroy();
            var_243 = null;
         }
      }
   }
}
