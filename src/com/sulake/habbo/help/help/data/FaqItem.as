package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1293:int;
      
      private var var_1294:String;
      
      private var var_1974:String;
      
      private var _index:int;
      
      private var var_1973:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1293 = param1;
         var_1974 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1294;
      }
      
      public function get questionId() : int
      {
         return var_1293;
      }
      
      public function get questionText() : String
      {
         return var_1974;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1294 = param1;
         var_1973 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_1973;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
