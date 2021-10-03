package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_120:DisplayObject;
      
      private var var_2282:uint;
      
      private var var_763:IWindowToolTipAgentService;
      
      private var var_759:IWindowMouseScalingService;
      
      private var var_233:IWindowContext;
      
      private var var_761:IWindowFocusManagerService;
      
      private var var_760:IWindowMouseListenerService;
      
      private var var_762:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2282 = 0;
         var_120 = param2;
         var_233 = param1;
         var_762 = new WindowMouseDragger(param2);
         var_759 = new WindowMouseScaler(param2);
         var_760 = new WindowMouseListener(param2);
         var_761 = new FocusManager(param2);
         var_763 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_759;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_761;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_763;
      }
      
      public function dispose() : void
      {
         if(var_762 != null)
         {
            var_762.dispose();
            var_762 = null;
         }
         if(var_759 != null)
         {
            var_759.dispose();
            var_759 = null;
         }
         if(var_760 != null)
         {
            var_760.dispose();
            var_760 = null;
         }
         if(var_761 != null)
         {
            var_761.dispose();
            var_761 = null;
         }
         if(var_763 != null)
         {
            var_763.dispose();
            var_763 = null;
         }
         var_233 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_760;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_762;
      }
   }
}
