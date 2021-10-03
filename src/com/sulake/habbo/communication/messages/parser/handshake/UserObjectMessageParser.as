package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_576:String;
      
      private var var_2293:String;
      
      private var var_2292:int;
      
      private var var_2294:int;
      
      private var var_1277:String;
      
      private var var_1297:String;
      
      private var _name:String;
      
      private var var_463:int;
      
      private var var_789:int;
      
      private var var_2296:int;
      
      private var var_2064:int;
      
      private var var_2295:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2294;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1297;
      }
      
      public function get customData() : String
      {
         return this.var_2293;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_463;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2292;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2295;
      }
      
      public function get figure() : String
      {
         return this.var_576;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2064;
      }
      
      public function get sex() : String
      {
         return this.var_1277;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_576 = param1.readString();
         this.var_1277 = param1.readString();
         this.var_2293 = param1.readString();
         this.var_1297 = param1.readString();
         this.var_2296 = param1.readInteger();
         this.var_2295 = param1.readString();
         this.var_2292 = param1.readInteger();
         this.var_2294 = param1.readInteger();
         this.var_2064 = param1.readInteger();
         this.var_789 = param1.readInteger();
         this.var_463 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2296;
      }
      
      public function get respectLeft() : int
      {
         return this.var_789;
      }
   }
}
