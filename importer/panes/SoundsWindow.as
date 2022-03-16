package importer.panes
{
   import anifire.constant.AnimeConstants;
   import anifire.util.UtilDict;
   import anifire.util.UtilLicense;
   import flash.display.DisplayObject;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.VBox;
   import mx.controls.Label;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class SoundsWindow extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SoundsWindow_Label1:Label;
      
      private var _384588720_soundNonUploadableNotice:Canvas;
      
      private var _1847246922_txtSoundNonUploadable:Text;
      
      private var _1564649305_txtSoundUploadable:Text;
      
      private var _22440074_vsUploadS:UploadFileWindow;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _bottom:importer;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SoundsWindow()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"_soundNonUploadableNotice",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "visible":false,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"_txtSoundNonUploadable",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"txtSoundUploadDisabled",
                                 "width":388,
                                 "height":136,
                                 "selectable":false
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Text,
                           "id":"_txtSoundUploadable",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"txtSoundUploadEnabled",
                                 "width":545,
                                 "height":41,
                                 "selectable":false
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":VBox,
                  "stylesFactory":function():void
                  {
                     this.verticalGap = 20;
                     this.paddingLeft = 72;
                     this.paddingRight = 72;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "y":128,
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":VBox,
                           "stylesFactory":function():void
                           {
                              this.horizontalAlign = "center";
                              this.verticalGap = 10;
                              this.paddingBottom = 10;
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":100,
                                 "styleName":"WhiteBox",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"stickComputer",
                                          "percentWidth":100,
                                          "childDescriptors":[new UIComponentDescriptor({
                                             "type":Label,
                                             "id":"_SoundsWindow_Label1",
                                             "propertiesFactory":function():Object
                                             {
                                                return {"styleName":"stickComputerText"};
                                             }
                                          })]
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":UploadFileWindow,
                                    "id":"_vsUploadS",
                                    "events":{
                                       "show":"___vsUploadS_show",
                                       "creationComplete":"___vsUploadS_creationComplete"
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"upload_message":false};
                                    }
                                 })]
                              };
                           }
                        })]
                     };
                  }
               })]};
            }
         });
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SoundsWindow_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importer_panes_SoundsWindowWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SoundsWindow[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SoundsWindow._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function init(param1:Object) : void
      {
         var _loc2_:int = 0;
         var _loc3_:DisplayObject = null;
         if(param1 == null)
         {
            return;
         }
         this._bottom = param1 as importer;
         if(this._vsUploadS != null)
         {
            this._vsUploadS.init(this._bottom);
         }
         if(!UtilLicense.isSoundUploadable)
         {
            _loc2_ = 0;
            while(_loc2_ < this.numChildren)
            {
               _loc3_ = this.getChildAt(_loc2_);
               _loc3_.visible = false;
               _loc2_++;
            }
            this._soundNonUploadableNotice.visible = true;
            this._txtSoundNonUploadable.text = UtilDict.toDisplay("go",AnimeConstants.SOUND_NON_UPLOADABLE_MSG) + " " + this._bottom.licensorName;
         }
      }
      
      public function setButtonStatus(param1:Boolean) : void
      {
         this._bottom.setButtonStatus(param1);
      }
      
      public function ___vsUploadS_show(param1:FlexEvent) : void
      {
         this._vsUploadS.init(this._bottom);
      }
      
      public function ___vsUploadS_creationComplete(param1:FlexEvent) : void
      {
         this._vsUploadS.init(this._bottom);
         this._vsUploadS.filter = "sounds";
      }
      
      private function _SoundsWindow_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go",AnimeConstants.SOUND_UPLOADABLE_MSG);
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtSoundUploadable.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = "+ " + UtilDict.toDisplay("import","From your computer");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_SoundsWindow_Label1.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _soundNonUploadableNotice() : Canvas
      {
         return this._384588720_soundNonUploadableNotice;
      }
      
      public function set _soundNonUploadableNotice(param1:Canvas) : void
      {
         var _loc2_:Object = this._384588720_soundNonUploadableNotice;
         if(_loc2_ !== param1)
         {
            this._384588720_soundNonUploadableNotice = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_soundNonUploadableNotice",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtSoundNonUploadable() : Text
      {
         return this._1847246922_txtSoundNonUploadable;
      }
      
      public function set _txtSoundNonUploadable(param1:Text) : void
      {
         var _loc2_:Object = this._1847246922_txtSoundNonUploadable;
         if(_loc2_ !== param1)
         {
            this._1847246922_txtSoundNonUploadable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtSoundNonUploadable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtSoundUploadable() : Text
      {
         return this._1564649305_txtSoundUploadable;
      }
      
      public function set _txtSoundUploadable(param1:Text) : void
      {
         var _loc2_:Object = this._1564649305_txtSoundUploadable;
         if(_loc2_ !== param1)
         {
            this._1564649305_txtSoundUploadable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtSoundUploadable",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vsUploadS() : UploadFileWindow
      {
         return this._22440074_vsUploadS;
      }
      
      public function set _vsUploadS(param1:UploadFileWindow) : void
      {
         var _loc2_:Object = this._22440074_vsUploadS;
         if(_loc2_ !== param1)
         {
            this._22440074_vsUploadS = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vsUploadS",_loc2_,param1));
            }
         }
      }
   }
}
