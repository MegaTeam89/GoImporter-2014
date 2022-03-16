package mx.core
{
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.system.ApplicationDomain;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import mx.events.ModuleEvent;
   import mx.events.RSLEvent;
   import mx.resources.IResourceManager;
   import mx.resources.ResourceManager;
   import mx.utils.LoaderUtil;
   
   use namespace mx_internal;
   
   public class FlexModuleFactory extends MovieClip implements IFlexModuleFactory
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static const INIT_STATE:int = 0;
      
      private static const RSL_START_LOAD_STATE:int = 1;
      
      private static const APP_LOAD_STATE:int = 2;
      
      private static const APP_START_STATE:int = 3;
      
      private static const APP_RUNNING_STATE:int = 4;
      
      private static const ERROR_STATE:int = 5;
      
      private static const RSL_LOADING_STATE:int = 6;
       
      
      private var rslListLoader:RSLListLoader;
      
      private var mixinList:Array;
      
      private var state:int = 0;
      
      private var appReady:Boolean = false;
      
      private var appInitDone:Boolean = false;
      
      private var appLoaded:Boolean = false;
      
      private var timer:Timer = null;
      
      private var lastFrame:int;
      
      private var nextFrameTimer:Timer = null;
      
      private var errorMessage:String = null;
      
      private var resourceBundles:Array;
      
      private var rslDataList:Array;
      
      private var _allowDomainsInNewRSLs:Boolean = true;
      
      private var _allowInsecureDomainsInNewRSLs:Boolean = true;
      
      private var implMap:Object;
      
      public function FlexModuleFactory()
      {
         this.implMap = {};
         super();
         this.mixinList = this.info()["mixins"];
         stop();
         loaderInfo.addEventListener(Event.INIT,this.moduleInitHandler);
         loaderInfo.addEventListener(Event.COMPLETE,this.moduleCompleteHandler);
         var _loc1_:int = totalFrames == 1 ? 0 : 1;
         addEventListener(Event.ENTER_FRAME,this.docFrameListener);
         this.timer = new Timer(100);
         this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
         this.timer.start();
      }
      
      private function docFrameListener(param1:Event) : void
      {
         if(currentFrame == 2)
         {
            removeEventListener(Event.ENTER_FRAME,this.docFrameListener);
            if(totalFrames > 2)
            {
               addEventListener(Event.ENTER_FRAME,this.extraFrameListener);
            }
            this.docFrameHandler();
         }
      }
      
      private function extraFrameListener(param1:Event) : void
      {
         if(this.lastFrame == currentFrame)
         {
            return;
         }
         this.lastFrame = currentFrame;
         if(currentFrame + 1 > totalFrames)
         {
            removeEventListener(Event.ENTER_FRAME,this.extraFrameListener);
         }
         this.extraFrameHandler();
      }
      
      public function get allowDomainsInNewRSLs() : Boolean
      {
         return this._allowDomainsInNewRSLs;
      }
      
      public function set allowDomainsInNewRSLs(param1:Boolean) : void
      {
         this._allowDomainsInNewRSLs = param1;
      }
      
      public function get allowInsecureDomainsInNewRSLs() : Boolean
      {
         return this._allowInsecureDomainsInNewRSLs;
      }
      
      public function set allowInsecureDomainsInNewRSLs(param1:Boolean) : void
      {
         this._allowInsecureDomainsInNewRSLs = param1;
      }
      
      public function get preloadedRSLs() : Dictionary
      {
         return null;
      }
      
      public function addPreloadedRSL(param1:LoaderInfo, param2:Vector.<RSLData>) : void
      {
         var _loc3_:RSLEvent = null;
         this.preloadedRSLs[param1] = param2;
         if(hasEventListener(RSLEvent.RSL_ADD_PRELOADED))
         {
            _loc3_ = new RSLEvent(RSLEvent.RSL_ADD_PRELOADED);
            _loc3_.loaderInfo = param1;
            dispatchEvent(_loc3_);
         }
      }
      
      public function callInContext(param1:Function, param2:Object, param3:Array, param4:Boolean = true) : *
      {
         return undefined;
      }
      
      public function create(... rest) : Object
      {
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc2_:String = this.info()["mainClassName"];
         if(_loc2_ == null)
         {
            _loc5_ = (_loc4_ = loaderInfo.loaderURL).lastIndexOf(".");
            _loc6_ = _loc4_.lastIndexOf("/");
            _loc2_ = _loc4_.substring(_loc6_ + 1,_loc5_);
         }
         var _loc3_:Class = Class(this.getDefinitionByName(_loc2_));
         return !!_loc3_ ? new _loc3_() : null;
      }
      
      public function info() : Object
      {
         return {};
      }
      
      public function allowDomain(... rest) : void
      {
      }
      
      public function allowInsecureDomain(... rest) : void
      {
      }
      
      public function registerImplementation(param1:String, param2:Object) : void
      {
         var _loc3_:Object = this.implMap[param1];
         if(!_loc3_)
         {
            this.implMap[param1] = param2;
         }
      }
      
      public function getImplementation(param1:String) : Object
      {
         return this.implMap[param1];
      }
      
      public function getDefinitionByName(param1:String) : Object
      {
         var _loc3_:Object = null;
         var _loc2_:ApplicationDomain = this.info()["currentDomain"] as ApplicationDomain;
         if(_loc2_.hasDefinition(param1))
         {
            _loc3_ = _loc2_.getDefinition(param1);
         }
         return _loc3_;
      }
      
      private function update() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Class = null;
         var _loc4_:TextField = null;
         switch(this.state)
         {
            case INIT_STATE:
               if(!this.appInitDone)
               {
                  return;
               }
               this.getRSLInfo();
               if(this.rslListLoader.isDone())
               {
                  this.state = APP_LOAD_STATE;
               }
               else
               {
                  this.state = RSL_START_LOAD_STATE;
               }
               break;
            case RSL_START_LOAD_STATE:
               this.rslListLoader.load(null,this.rslCompleteHandler,this.rslErrorHandler,this.rslErrorHandler,this.rslErrorHandler);
               this.state = RSL_LOADING_STATE;
               break;
            case RSL_LOADING_STATE:
               if(this.rslListLoader.isDone())
               {
                  this.rslListLoader = null;
                  this.state = APP_LOAD_STATE;
               }
               break;
            case APP_LOAD_STATE:
               if(this.appLoaded)
               {
                  this.deferredNextFrame();
                  this.state = APP_START_STATE;
               }
               break;
            case APP_START_STATE:
               if(this.appReady)
               {
                  if(this.mixinList && this.mixinList.length > 0)
                  {
                     _loc1_ = this.mixinList.length;
                     _loc2_ = 0;
                     while(_loc2_ < _loc1_)
                     {
                        try
                        {
                           _loc3_ = Class(this.getDefinitionByName(this.mixinList[_loc2_]));
                           _loc3_["init"](this);
                        }
                        catch(e:Error)
                        {
                        }
                        _loc2_++;
                     }
                  }
                  this.state = APP_RUNNING_STATE;
                  this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
                  this.timer.reset();
                  dispatchEvent(new Event("ready"));
                  loaderInfo.removeEventListener(Event.COMPLETE,this.moduleCompleteHandler);
               }
               break;
            case ERROR_STATE:
               if(this.timer != null)
               {
                  this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
                  this.timer.reset();
               }
               (_loc4_ = new TextField()).text = this.errorMessage;
               _loc4_.x = 0;
               _loc4_.y = 0;
               _loc4_.autoSize = TextFieldAutoSize.LEFT;
               addChild(_loc4_);
               dispatchEvent(new ModuleEvent(ModuleEvent.ERROR,false,false,0,0,this.errorMessage));
               loaderInfo.removeEventListener(Event.COMPLETE,this.moduleCompleteHandler);
         }
      }
      
      private function getRSLInfo() : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Class = null;
         var _loc8_:Array = null;
         var _loc9_:Object = null;
         var _loc10_:RSLItem = null;
         var _loc1_:Array = this.info()["rsls"];
         var _loc2_:Array = this.info()["cdRsls"];
         var _loc3_:Array = [];
         if(_loc2_ && _loc2_.length > 0)
         {
            this.rslDataList = LoaderUtil.processRequiredRSLs(this,_loc2_);
            _loc6_ = LoaderUtil.normalizeURL(this.loaderInfo);
            _loc7_ = Class(this.getDefinitionByName("mx.core::CrossDomainRSLItem"));
            _loc4_ = this.rslDataList.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc8_ = this.rslDataList[_loc5_];
               _loc9_ = new _loc7_(_loc8_,_loc6_,this);
               _loc3_.push(_loc9_);
               _loc5_++;
            }
         }
         if(_loc1_ != null && _loc1_.length > 0)
         {
            if(_loc6_ == null)
            {
               _loc6_ = LoaderUtil.normalizeURL(this.loaderInfo);
            }
            _loc4_ = _loc1_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc10_ = new RSLItem(_loc1_[_loc5_].url,_loc6_,this);
               _loc3_.push(_loc10_);
               _loc5_++;
            }
         }
         this.rslListLoader = new RSLListLoader(_loc3_);
      }
      
      public function autorun() : Boolean
      {
         return true;
      }
      
      private function displayError(param1:String) : void
      {
         this.errorMessage = param1;
         this.state = ERROR_STATE;
         this.update();
      }
      
      private function docFrameHandler(param1:Event = null) : void
      {
         Singleton.registerClass("mx.managers::IBrowserManager",Class(this.getDefinitionByName("mx.managers::BrowserManagerImpl")));
         Singleton.registerClass("mx.managers::ICursorManager",Class(this.getDefinitionByName("mx.managers::CursorManagerImpl")));
         Singleton.registerClass("mx.managers::IDragManager",Class(this.getDefinitionByName("mx.managers::DragManagerImpl")));
         Singleton.registerClass("mx.managers::IHistoryManager",Class(this.getDefinitionByName("mx.managers::HistoryManagerImpl")));
         Singleton.registerClass("mx.managers::ILayoutManager",Class(this.getDefinitionByName("mx.managers::LayoutManager")));
         Singleton.registerClass("mx.managers::IPopUpManager",Class(this.getDefinitionByName("mx.managers::PopUpManagerImpl")));
         Singleton.registerClass("mx.resources::IResourceManager",Class(this.getDefinitionByName("mx.resources::ResourceManagerImpl")));
         Singleton.registerClass("mx.styles::IStyleManager",Class(this.getDefinitionByName("mx.styles::StyleManagerImpl")));
         Singleton.registerClass("mx.styles::IStyleManager2",Class(this.getDefinitionByName("mx.styles::StyleManagerImpl")));
         Singleton.registerClass("mx.managers::IToolTipManager2",Class(this.getDefinitionByName("mx.managers::ToolTipManagerImpl")));
         this.appReady = true;
         this.installCompiledResourceBundles();
         this.update();
         if(currentFrame < totalFrames)
         {
            this.deferredNextFrame();
         }
      }
      
      private function installCompiledResourceBundles() : void
      {
         var _loc1_:Object = this.info();
         var _loc2_:ApplicationDomain = _loc1_["currentDomain"];
         var _loc3_:Array = _loc1_["compiledLocales"];
         var _loc4_:Array = _loc1_["compiledResourceBundleNames"];
         var _loc5_:IResourceManager = ResourceManager.getInstance();
         this.resourceBundles = _loc5_.installCompiledResourceBundles(_loc2_,_loc3_,_loc4_,true);
         if(!_loc5_.localeChain)
         {
            _loc5_.initializeLocaleChain(_loc3_);
         }
      }
      
      private function deferredNextFrame() : void
      {
         if(currentFrame + 1 <= framesLoaded)
         {
            nextFrame();
         }
         else
         {
            this.nextFrameTimer = new Timer(100);
            this.nextFrameTimer.addEventListener(TimerEvent.TIMER,this.nextFrameTimerHandler);
            this.nextFrameTimer.start();
         }
      }
      
      private function extraFrameHandler(param1:Event = null) : void
      {
         var _loc3_:Class = null;
         var _loc2_:Object = this.info()["frames"];
         if(_loc2_ && _loc2_[currentLabel])
         {
            try
            {
               _loc3_ = Class(this.getDefinitionByName(_loc2_[currentLabel]));
               _loc3_["frame"](this);
            }
            catch(e:Error)
            {
            }
         }
         if(currentFrame < totalFrames)
         {
            this.deferredNextFrame();
         }
      }
      
      private function rslCompleteHandler(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Vector.<RSLData> = null;
         var _loc4_:IFlexModuleFactory = null;
         if(param1.target is LoaderInfo)
         {
            _loc2_ = this.rslListLoader.getIndex();
            _loc3_ = Vector.<RSLData>(this.rslDataList[_loc2_]);
            _loc4_ = this;
            if(_loc3_ && _loc3_[0].moduleFactory)
            {
               _loc4_ = _loc3_[0].moduleFactory;
            }
            if(_loc4_ == this)
            {
               this.preloadedRSLs[param1.target] = _loc3_;
            }
            else
            {
               _loc4_.addPreloadedRSL(LoaderInfo(param1.target),_loc3_);
            }
         }
         this.update();
      }
      
      private function rslErrorHandler(param1:Event) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc2_:RSLItem = this.rslListLoader.getItem(this.rslListLoader.getIndex());
         if(param1 is ErrorEvent)
         {
            _loc3_ = ErrorEvent(param1).text;
         }
         if(!_loc3_)
         {
            _loc3_ = "";
         }
         _loc4_ = "RSL " + _loc2_.urlRequest.url + " failed to load. " + _loc3_;
         this.displayError(_loc4_);
      }
      
      private function moduleInitHandler(param1:Event) : void
      {
         loaderInfo.removeEventListener(Event.INIT,this.moduleInitHandler);
         this.appInitDone = true;
         this.update();
      }
      
      private function moduleCompleteHandler(param1:Event) : void
      {
         this.appLoaded = true;
         this.update();
      }
      
      private function timerHandler(param1:TimerEvent) : void
      {
         if(totalFrames > 2 && framesLoaded >= 2 || framesLoaded == totalFrames)
         {
            this.appLoaded = true;
         }
         this.update();
      }
      
      private function nextFrameTimerHandler(param1:TimerEvent) : void
      {
         if(currentFrame + 1 <= framesLoaded)
         {
            nextFrame();
            this.nextFrameTimer.removeEventListener(TimerEvent.TIMER,this.nextFrameTimerHandler);
            this.nextFrameTimer.reset();
         }
      }
   }
}
