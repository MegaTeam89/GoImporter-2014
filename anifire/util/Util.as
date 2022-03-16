package anifire.util
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.LanguageConstants;
   import anifire.constant.ServerConstants;
   import anifire.event.LoadMgrEvent;
   import com.google.analytics.AnalyticsTracker;
   import com.google.analytics.GATracker;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLVariables;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   import mx.core.FlexGlobals;
   import mx.events.ResourceEvent;
   import mx.events.StyleEvent;
   import mx.resources.ResourceManager;
   
   public class Util
   {
      
      public static var tracker:AnalyticsTracker;
      
      public static var isDebugMode:Boolean = false;
      
      private static var flashVar_index_by_application:Dictionary = new Dictionary();
      
      private static var _currentThemeCode:String;
       
      
      public function Util()
      {
         super();
      }
      
      public static function roundNum(param1:Number, param2:int = 1) : Number
      {
         return Math.round(param1 * Math.pow(10,param2)) / Math.pow(10,param2);
      }
      
      public static function cielNum(param1:Number, param2:int = 1) : Number
      {
         return Math.ceil(param1 * Math.pow(10,param2)) / Math.pow(10,param2);
      }
      
      public static function initLog() : void
      {
      }
      
      public static function getCharacter(param1:MovieClip) : MovieClip
      {
         if(param1 == null)
         {
            return null;
         }
         return UtilPlain.getCharacter(param1);
      }
      
      public static function traceDisplayList(param1:DisplayObjectContainer, param2:String = "") : void
      {
         UtilPlain.traceDisplayList(param1,param2);
      }
      
      public static function setFlashVar(param1:String, param2:String, param3:Object = null) : void
      {
         if(param3 == null)
         {
            param3 = FlexGlobals.topLevelApplication as Object;
         }
         getFlashVar(param3);
         var _loc4_:UtilHashArray;
         (_loc4_ = flashVar_index_by_application[param3] as UtilHashArray).push(param1,param2);
      }
      
      public static function getFlashVar(param1:Object = null) : UtilHashArray
      {
         var _loc2_:UtilHashArray = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            param1 = FlexGlobals.topLevelApplication as Object;
         }
         if(flashVar_index_by_application[param1] == null)
         {
            _loc2_ = new UtilHashArray();
            for(_loc3_ in param1.parameters)
            {
               _loc2_.push(_loc3_,param1.parameters[_loc3_]);
            }
            flashVar_index_by_application[param1] = _loc2_;
         }
         else
         {
            _loc2_ = flashVar_index_by_application[param1];
         }
         return _loc2_.clone();
      }
      
      public static function addFlashVarsToURLvar(param1:URLVariables) : void
      {
         UtilPlain.addFlashVarsToURLvar(getFlashVar(),param1);
      }
      
      public static function capturePicture(param1:DisplayObject, param2:Rectangle = null, param3:int = 0, param4:int = 0) : BitmapData
      {
         var _loc5_:BitmapData = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:BitmapData = null;
         var _loc9_:Matrix = null;
         var _loc10_:BitmapData = null;
         try
         {
            _loc6_ = param3 == 0 ? int(param1.width) : int(param3);
            _loc7_ = param4 == 0 ? int(param1.height) : int(param4);
            _loc8_ = param1.width == 0 ? new BitmapData(100,100) : new BitmapData(_loc6_,_loc7_);
            _loc9_ = new Matrix();
            _loc8_.draw(param1,_loc9_);
            if(param2 == null || _loc8_ == null)
            {
               _loc5_ = _loc8_;
            }
            else
            {
               (_loc10_ = new BitmapData(param2.width,param2.height)).copyPixels(_loc8_,param2,new Point());
               _loc5_ = _loc10_;
            }
         }
         catch(e:Error)
         {
         }
         return _loc5_;
      }
      
      public static function gaTracking(param1:String, param2:DisplayObject) : void
      {
         var _loc4_:* = null;
         var _loc7_:String = null;
         var _loc3_:String = Util.getFlashVar().getValueByKey(ServerConstants.PARAM_APPCODE) as String;
         var _loc5_:Boolean = param1 == AnimeConstants.GA_ACTION__AUTO_SAVE ? true : false;
         if(_loc3_ == "go")
         {
            param1 = "/pageTracker" + param1;
            _loc4_ = "pageTracker._trackPageview(\'" + param1 + "\')";
         }
         else
         {
            param1 = "/urchin" + param1;
            _loc4_ = "urchinTracker(\'" + param1 + "\')";
         }
         var _loc6_:UtilHashArray;
         if((_loc6_ = getFlashVar()).getValueByKey(ServerConstants.PARAM_ISEMBED_ID) as String == "0")
         {
            if(_loc6_.getValueByKey(ServerConstants.PARAM_ISOFFLINE) != "1")
            {
               if(GoExtInterface.available)
               {
                  GoExtInterface.call(_loc4_);
               }
            }
         }
         else if(param2 != null)
         {
            try
            {
               if(UtilSite.siteId == UtilSite.SKOLETUBE)
               {
                  _loc7_ = "UA-2516970-20";
               }
               else if(UtilLicense.getCurrentLicenseId() != "7")
               {
                  _loc7_ = "UA-2516970-7";
               }
               else
               {
                  _loc7_ = "UA-2516970-11";
               }
               tracker = new GATracker(param2,_loc7_,"AS3",false);
               tracker.trackPageview(param1);
            }
            catch(error:Error)
            {
            }
         }
         UtilErrorLogger.getInstance().appendCustomError(param1);
      }
      
      public static function preferLanguageShortCode() : String
      {
         var _loc1_:UtilHashArray = Util.getFlashVar();
         var _loc2_:String = _loc1_.getValueByKey(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE);
         var _loc3_:String = LanguageConstants.MEDIUM_TO_SHORT_LANG_CODES_MAPPING.getValueByKey(_loc2_);
         if(_loc3_ == null)
         {
            _loc3_ = AnimeConstants.LANGUAGE_CODE_ENGLISH;
         }
         return _loc3_;
      }
      
      public static function getMovieThumbnailUrl() : String
      {
         var _loc1_:String = null;
         var _loc2_:UtilHashArray = Util.getFlashVar();
         _loc1_ = _loc2_.getValueByKey(ServerConstants.FLASHVAR_THUMBNAIL) as String;
         var _loc3_:String = "http://";
         if(_loc1_ == null)
         {
            _loc1_ = "";
         }
         else if(_loc1_.length <= _loc3_.length || _loc1_.substr(0,_loc3_.length) != _loc3_)
         {
            _loc1_ = (_loc2_.getValueByKey(ServerConstants.FLASHVAR_APISERVER) as String) + _loc1_;
         }
         return _loc1_;
      }
      
      public static function get currentThemeCode() : String
      {
         return _currentThemeCode;
      }
      
      public static function loadClientTheming(param1:Array, param2:Array, param3:Array, param4:Function = null) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc10_:IEventDispatcher = null;
         var _loc8_:UtilLoadMgr = new UtilLoadMgr();
         if(param4 != null)
         {
            _loc8_.addEventListener(LoadMgrEvent.ALL_COMPLETE,param4);
         }
         var _loc9_:int = 0;
         while(_loc9_ < param1.length)
         {
            _loc5_ = param1[_loc9_] as String;
            _loc6_ = param2[_loc9_] as String;
            _loc7_ = param3[_loc9_] as String;
            _loc10_ = FlexGlobals.topLevelApplication.styleManager.loadStyleDeclarations(UtilNetwork.getClientThemeUrl(_loc7_,_loc6_,_loc5_),true);
            _loc8_.addEventDispatcher(_loc10_ as EventDispatcher,StyleEvent.COMPLETE);
            _loc10_.addEventListener(StyleEvent.ERROR,onLoadClientThemingError);
            _loc9_++;
         }
         _loc8_.commit();
      }
      
      private static function onLoadClientThemingError(param1:StyleEvent) : void
      {
      }
      
      private static function unloadClientTheming(param1:Array, param2:Array, param3:Array) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         while(_loc7_ < param1.length)
         {
            _loc4_ = param1[_loc7_] as String;
            _loc5_ = param2[_loc7_] as String;
            _loc6_ = param3[_loc7_] as String;
            FlexGlobals.topLevelApplication.styleManager.unloadStyleDeclarations(UtilNetwork.getClientThemeUrl(_loc6_,_loc5_,_loc4_),true);
            _loc7_++;
         }
      }
      
      public static function isVideoRecording() : Boolean
      {
         return Util.getFlashVar().getValueByKey(ServerConstants.FLASHVAR_IS_VIDEO_RECORD_MODE) == "1";
      }
      
      public static function is1080Recording() : Boolean
      {
         return Util.getFlashVar().getValueByKey(ServerConstants.FLASHVAR_IS_VIDEO_RECORD_MODE) == "1" && Util.getFlashVar().getValueByKey(ServerConstants.FLASHVAR_CUSTOM_PLAYER_HEIGHT) == "1080";
      }
      
      public static function loadClientLocale(param1:String, param2:Function) : void
      {
         var langCode:String = null;
         var themeCode:String = null;
         var eventDispatcher:IEventDispatcher = null;
         var app:String = param1;
         var callback:Function = param2;
         var flashVar:UtilHashArray = Util.getFlashVar();
         langCode = flashVar.getValueByKey(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE);
         themeCode = flashVar.getValueByKey(ServerConstants.FLASHVAR_CLIENT_THEME_CODE);
         if(themeCode == null || themeCode == "silver")
         {
            themeCode = "go";
         }
         if(!langCode)
         {
            langCode = "en_US";
         }
         var resourceModuleURL:String = UtilNetwork.getClientLocaleUrl(themeCode,langCode,"framework");
         eventDispatcher = ResourceManager.getInstance().loadResourceModule(resourceModuleURL);
         function():void
         {
            var counter:* = 2;
            var _callback:* = function(param1:Event):void
            {
               if(--counter == 0)
               {
                  callback(null);
               }
            };
            UtilGettext.initAggregate(app,themeCode,langCode,_callback);
            eventDispatcher.addEventListener(ResourceEvent.COMPLETE,_callback);
         }();
         ResourceManager.getInstance().localeChain = [langCode];
      }
      
      public static function playerIsUpdated(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:String = Capabilities.version;
         var _loc4_:Array;
         var _loc5_:String = (_loc4_ = _loc3_.split(" "))[0];
         var _loc6_:Array = _loc4_[1].split(",");
         var _loc7_:Number = parseInt(_loc6_[0]);
         var _loc8_:Number = parseInt(_loc6_[1]);
         var _loc9_:Number = parseInt(_loc6_[2]);
         var _loc10_:Number = parseInt(_loc6_[3]);
         if(_loc7_ > param1)
         {
            return true;
         }
         if(_loc7_ == param1 && _loc8_ >= param2)
         {
            return true;
         }
         return false;
      }
   }
}
