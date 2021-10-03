package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_861:ConversationsTabView;
      
      private var _disposed:Boolean = false;
      
      private var var_121:HabboMessenger;
      
      private var var_1262:ConversationView;
      
      private var var_14:IFrameWindow;
      
      private var var_412:Timer;
      
      private var var_706:ITextFieldWindow;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         var_121 = param1;
         var_412 = new Timer(300,1);
         var_412.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(var_14 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         var_1262.addMessage(param2);
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = "null";
            if(_loc5_.length > _loc4_)
            {
               var_706.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         var_14.visible = false;
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1262.afterResize();
         this.var_861.refresh();
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = "null";
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = var_121.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         var_121.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         var_706.text = "";
         var_121.conversations.addMessageAndUpdateView(new Message(Message.const_608,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function refresh(param1:Boolean) : void
      {
         if(var_14 == null)
         {
            return;
         }
         var _loc2_:Conversation = var_121.conversations.findSelectedConversation();
         var_14.caption = _loc2_ == null ? "" : _loc2_.name;
         var_861.refresh();
         var_1262.refresh();
         if(var_121.conversations.openConversations.length < 1)
         {
            var_14.visible = false;
            var_121.setHabboToolbarIcon(false,false);
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_412)
            {
               var_412.stop();
               var_412.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_412 = null;
            }
            var_121 = null;
            _disposed = true;
         }
      }
      
      public function openMessenger() : void
      {
         if(var_121.conversations.openConversations.length < 1)
         {
            return;
         }
         if(var_14 == null)
         {
            prepareContent();
            refresh(true);
            var_121.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.MESSENGER,var_14));
         }
         else
         {
            refresh(true);
            var_14.visible = true;
            var_14.activate();
         }
      }
      
      public function getTabCount() : int
      {
         return this.var_861 == null ? 7 : int(this.var_861.getTabCount());
      }
      
      public function isMessengerOpen() : Boolean
      {
         return var_14 != null && false;
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_45 || param2 != var_14)
         {
            return;
         }
         if(!this.var_412.running)
         {
            this.var_412.reset();
            this.var_412.start();
         }
      }
      
      public function close() : void
      {
         if(var_14 != null)
         {
            var_14.visible = false;
         }
      }
      
      private function prepareContent() : void
      {
         var_14 = IFrameWindow(var_121.getXmlWindow("main_window"));
         var _loc1_:IWindow = var_14.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_14.procedure = onWindow;
         var_14.title.color = 4294623744;
         var_14.title.textColor = 4287851525;
         var_861 = new ConversationsTabView(var_121,var_14);
         var_861.refresh();
         var_706 = ITextFieldWindow(var_14.findChildByName("message_input"));
         var_706.addEventListener(WindowKeyboardEvent.const_148,onMessageInput);
         var_1262 = new ConversationView(var_121,var_14);
         var_14.scaler.setParamFlag(HabboWindowParam.const_732,false);
         var_14.scaler.setParamFlag(HabboWindowParam.const_954,true);
      }
   }
}
