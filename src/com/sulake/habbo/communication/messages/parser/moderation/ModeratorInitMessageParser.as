package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_2244:Boolean;
      
      private var var_1585:Array;
      
      private var var_2245:Boolean;
      
      private var var_2241:Boolean;
      
      private var var_2243:Boolean;
      
      private var var_150:Array;
      
      private var var_2242:Boolean;
      
      private var var_2239:Boolean;
      
      private var var_1586:Array;
      
      private var var_2240:Boolean;
      
      private var var_2238:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_2238;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2244;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2245;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2242;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2239;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1585;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_150 = [];
         var_1585 = [];
         _roomMessageTemplates = [];
         var_1586 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_150.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1585.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1586.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2242 = param1.readBoolean();
         var_2243 = param1.readBoolean();
         var_2245 = param1.readBoolean();
         var_2241 = param1.readBoolean();
         var_2238 = param1.readBoolean();
         var_2239 = param1.readBoolean();
         var_2244 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_2240 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2241;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1586;
      }
      
      public function get issues() : Array
      {
         return var_150;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2240;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2243;
      }
   }
}
