package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["RoomWidgetBadgeImageUpdateEvent"] = const_132;
         param1["bound_to_parent_rect"] = const_84;
         param1["child_window"] = const_889;
         param1["embedded_controller"] = const_303;
         param1["resize_to_accommodate_children"] = const_61;
         param1["input_event_processor"] = const_50;
         param1["internal_event_handling"] = const_734;
         param1["mouse_dragging_target"] = const_198;
         param1["mouse_dragging_trigger"] = const_295;
         param1["mouse_scaling_target"] = const_267;
         param1["mouse_scaling_trigger"] = const_378;
         param1["horizontal_mouse_scaling_trigger"] = const_209;
         param1["vertical_mouse_scaling_trigger"] = const_211;
         param1["observe_parent_input_events"] = const_900;
         param1["optimize_region_to_layout_size"] = const_473;
         param1["parent_window"] = const_790;
         param1["relative_horizontal_scale_center"] = const_171;
         param1["relative_horizontal_scale_fixed"] = const_121;
         param1["relative_horizontal_scale_move"] = const_338;
         param1["relative_horizontal_scale_strech"] = const_236;
         param1["relative_scale_center"] = const_963;
         param1["relative_scale_fixed"] = const_509;
         param1["relative_scale_move"] = const_987;
         param1["relative_scale_strech"] = const_972;
         param1["relative_vertical_scale_center"] = const_179;
         param1["relative_vertical_scale_fixed"] = const_114;
         param1["relative_vertical_scale_move"] = const_294;
         param1["relative_vertical_scale_strech"] = const_265;
         param1["on_resize_align_left"] = const_568;
         param1["on_resize_align_right"] = const_464;
         param1["on_resize_align_center"] = const_443;
         param1["on_resize_align_top"] = const_705;
         param1["on_resize_align_bottom"] = const_414;
         param1["on_resize_align_middle"] = const_437;
         param1["on_accommodate_align_left"] = const_859;
         param1["on_accommodate_align_right"] = const_474;
         param1["on_accommodate_align_center"] = const_594;
         param1["on_accommodate_align_top"] = const_865;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_510;
         param1["route_input_events_to_parent"] = const_395;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_817;
         param1["scalable_with_mouse"] = const_931;
         param1["reflect_horizontal_resize_to_parent"] = const_455;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_256;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
