package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var var_2318:Boolean;
      
      private var var_1500:int;
      
      private var var_2317:String = "";
      
      private var var_72:ITextFieldWindow;
      
      private var var_2316:uint;
      
      private var _orgTextBackgroundColor:uint;
      
      private var _navigator:HabboNavigator;
      
      private var var_1197:String = "";
      
      private var var_155:IWindowContainer;
      
      private var var_306:Boolean;
      
      private var var_1253:Function;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         _navigator = param1;
         var_72 = param2;
         var_1500 = param3;
         var_1253 = param4;
         if(param5 != null)
         {
            var_306 = true;
            var_1197 = param5;
            var_72.text = param5;
         }
         Util.setProcDirectly(var_72,onInputClick);
         var_72.addEventListener(WindowKeyboardEvent.const_148,checkEnterPress);
         var_72.addEventListener(WindowEvent.const_154,checkMaxLen);
         this.var_2318 = var_72.textBackground;
         this._orgTextBackgroundColor = var_72.textBackgroundColor;
         this.var_2316 = var_72.textColor;
      }
      
      private function checkEnterPress(param1:Event) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = WindowKeyboardEvent(param1);
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            if(var_1253 != null)
            {
               var_1253();
            }
         }
      }
      
      public function goBackToInitialState() : void
      {
         clearErrors();
         if(var_1197 != null)
         {
            var_72.text = var_1197;
            var_306 = true;
         }
         else
         {
            var_72.text = "";
            var_306 = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return var_72;
      }
      
      public function restoreBackground() : void
      {
         var_72.textBackground = this.var_2318;
         var_72.textBackgroundColor = this._orgTextBackgroundColor;
         var_72.textColor = this.var_2316;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_217)
         {
            return;
         }
         if(!var_306)
         {
            return;
         }
         var_72.text = var_2317;
         var_306 = false;
         this.restoreBackground();
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_155 != null)
         {
            var_155.visible = false;
         }
      }
      
      public function displayError(param1:String) : void
      {
         var_72.textBackground = true;
         var_72.textBackgroundColor = 4294021019;
         var_72.textColor = 4278190080;
         if(this.var_155 == null)
         {
            this.var_155 = IWindowContainer(_navigator.getXmlWindow("nav_error_popup"));
            _navigator.refreshButton(this.var_155,"popup_arrow_down",true,null,0);
            IWindowContainer(var_72.parent).addChild(this.var_155);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_155.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         var_155.findChildByName("border").width = _loc2_.width + 15;
         var_155.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         var_72.getLocalPosition(_loc3_);
         this.var_155.x = _loc3_.x;
         this.var_155.y = _loc3_.y - this.var_155.height + 3;
         var _loc4_:IWindow = var_155.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_155.width / 2 - _loc4_.width / 2;
         var_155.x += (0 - 0) / 2;
         this.var_155.visible = true;
      }
      
      public function getText() : String
      {
         if(var_306)
         {
            return var_2317;
         }
         return var_72.text;
      }
      
      private function isInputValid() : Boolean
      {
         return !var_306 && Util.trim(getText()).length > 2;
      }
      
      public function setText(param1:String) : void
      {
         var_306 = false;
         var_72.text = param1;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!isInputValid())
         {
            displayError(param1);
            return false;
         }
         restoreBackground();
         return true;
      }
      
      private function checkMaxLen(param1:Event) : void
      {
         var _loc2_:String = "null";
         if(_loc2_.length > var_1500)
         {
            var_72.text = _loc2_.substring(0,var_1500);
         }
      }
   }
}
