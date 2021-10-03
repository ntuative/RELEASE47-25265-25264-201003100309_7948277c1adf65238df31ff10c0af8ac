package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_1289:String;
      
      private var _disposed:Boolean;
      
      private var var_1463:String;
      
      private var var_1288:int;
      
      private var _main:ModerationManager;
      
      private var var_827:IDropMenuWindow;
      
      private var var_423:ITextFieldWindow;
      
      private var var_55:IFrameWindow;
      
      private var var_306:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         _main = param1;
         var_1288 = param2;
         var_1463 = param3;
         var_1289 = param4;
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
         var_423.text = "";
         var_306 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_55;
      }
      
      public function getId() : String
      {
         return var_1463;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_306 || false)
         {
            _main.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         _main.connection.send(new ModMessageMessageComposer(var_1288,var_423.text,var_1289));
         this.dispose();
      }
      
      public function show() : void
      {
         var_55 = IFrameWindow(_main.getXmlWindow("send_msgs"));
         var_55.caption = "Msg To: " + var_1463;
         var_55.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_423 = ITextFieldWindow(var_55.findChildByName("message_input"));
         var_423.procedure = onInputClick;
         var_827 = IDropMenuWindow(var_55.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_827);
         var_827.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_55.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_55.visible = true;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + _main.initMsg.messageTemplates.length);
         param1.populate(_main.initMsg.messageTemplates);
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_55 != null)
         {
            var_55.destroy();
            var_55 = null;
         }
         var_827 = null;
         var_423 = null;
         _main = null;
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_53)
         {
            return;
         }
         var _loc3_:String = _main.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_306 = false;
            var_423.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1263;
      }
   }
}
