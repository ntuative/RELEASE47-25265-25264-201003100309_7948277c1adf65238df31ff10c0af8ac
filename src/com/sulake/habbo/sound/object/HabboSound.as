package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_996:SoundChannel = null;
      
      private var var_819:Boolean;
      
      private var var_995:Sound = null;
      
      private var var_634:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_995 = param1;
         var_995.addEventListener(Event.COMPLETE,onComplete);
         var_634 = 1;
         var_819 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_819;
      }
      
      public function stop() : Boolean
      {
         var_996.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_819 = false;
         var_996 = var_995.play(0);
         this.volume = var_634;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_634;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_996.position;
      }
      
      public function get length() : Number
      {
         return var_995.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_634 = param1;
         if(var_996 != null)
         {
            var_996.soundTransform = new SoundTransform(var_634);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_819 = true;
      }
   }
}
