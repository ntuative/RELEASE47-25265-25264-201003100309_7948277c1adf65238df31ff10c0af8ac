package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_926:String = "select_outfit";
       
      
      private var var_2186:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_926);
         var_2186 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2186;
      }
   }
}
