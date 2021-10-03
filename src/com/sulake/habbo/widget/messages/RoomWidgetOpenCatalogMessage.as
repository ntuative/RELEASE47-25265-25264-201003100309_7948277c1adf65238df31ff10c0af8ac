package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_676:String = "RWOCM_CLUB_MAIN";
      
      public static const const_690:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1941:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_690);
         var_1941 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1941;
      }
   }
}
