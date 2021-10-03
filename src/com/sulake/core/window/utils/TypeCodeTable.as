package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_537;
         param1["bitmap"] = const_626;
         param1["border"] = const_659;
         param1["border_notify"] = const_1142;
         param1["button"] = const_478;
         param1["button_thick"] = const_670;
         param1["button_icon"] = const_1152;
         param1["button_group_left"] = const_611;
         param1["button_group_center"] = const_566;
         param1["button_group_right"] = const_577;
         param1["canvas"] = const_539;
         param1["checkbox"] = const_583;
         param1["closebutton"] = const_789;
         param1["container"] = const_310;
         param1["container_button"] = const_585;
         param1["display_object_wrapper"] = const_673;
         param1["dropmenu"] = const_372;
         param1["dropmenu_item"] = const_425;
         param1["frame"] = const_297;
         param1["frame_notify"] = const_1266;
         param1["header"] = const_516;
         param1["icon"] = const_919;
         param1["itemgrid"] = const_956;
         param1["itemgrid_horizontal"] = const_460;
         param1["itemgrid_vertical"] = const_503;
         param1["itemlist"] = const_791;
         param1["itemlist_horizontal"] = const_287;
         param1["itemlist_vertical"] = const_304;
         param1["maximizebox"] = const_1321;
         param1["menu"] = const_1225;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_796;
         param1["minimizebox"] = const_1177;
         param1["notify"] = const_1388;
         param1["RoomWidgetBadgeImageUpdateEvent"] = const_645;
         param1["password"] = const_501;
         param1["radiobutton"] = const_623;
         param1["region"] = const_470;
         param1["restorebox"] = const_1375;
         param1["scaler"] = const_983;
         param1["scaler_horizontal"] = const_1219;
         param1["scaler_vertical"] = const_1218;
         param1["scrollbar_horizontal"] = const_358;
         param1["scrollbar_vertical"] = const_630;
         param1["scrollbar_slider_button_up"] = const_986;
         param1["scrollbar_slider_button_down"] = const_991;
         param1["scrollbar_slider_button_left"] = const_841;
         param1["scrollbar_slider_button_right"] = const_967;
         param1["scrollbar_slider_bar_horizontal"] = const_827;
         param1["scrollbar_slider_bar_vertical"] = const_797;
         param1["scrollbar_slider_track_horizontal"] = const_949;
         param1["scrollbar_slider_track_vertical"] = const_861;
         param1["scrollable_itemlist"] = const_1299;
         param1["scrollable_itemlist_vertical"] = const_481;
         param1["scrollable_itemlist_horizontal"] = const_855;
         param1["selector"] = const_529;
         param1["selector_list"] = const_520;
         param1["submenu"] = const_796;
         param1["tab_button"] = const_693;
         param1["tab_container_button"] = const_1009;
         param1["tab_context"] = const_436;
         param1["tab_content"] = const_807;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_708;
         param1["input"] = const_731;
         param1["toolbar"] = const_1163;
         param1["tooltip"] = const_323;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
