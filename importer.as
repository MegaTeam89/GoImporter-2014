package
{
   import anifire.component.IconTextButton;
   import anifire.constant.AnimeConstants;
   import anifire.constant.ServerConstants;
   import anifire.interfaces.IConsoleImportable;
   import anifire.interfaces.IImporter;
   import anifire.managers.AppConfigManager;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilLicense;
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   import flash.events.DataEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.system.Security;
   import flash.utils.ByteArray;
   import flash.utils.Proxy;
   import flash.utils.Timer;
   import flash.utils.getDefinitionByName;
   import importer.panes.FlashWindow;
   import importer.panes.ImageWindow;
   import importer.panes.SoundsWindow;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.containers.Canvas;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.CheckBox;
   import mx.controls.ComboBox;
   import mx.controls.Image;
   import mx.controls.Label;
   import mx.controls.TabBar;
   import mx.controls.Text;
   import mx.controls.TextInput;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ListEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.CursorManager;
   import mx.modules.Module;
   import mx.styles.CSSCondition;
   import mx.styles.CSSSelector;
   import mx.styles.CSSStyleDeclaration;
   import mx.utils.ObjectProxy;
   
   use namespace mx_internal;
   
   public class importer extends Module implements IImporter, IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      {
         Security.allowDomain("staging-cdn.org","godevstorage.s3.amazonaws.com","*.amazonaws.com","*.s3.amazonaws.com","*.goanimate.org","*.goanimate.com","goanimate.com","demo.cdn.goanimate.com","demo.goanimate.com","es.goanimate.com","fr.goanimate.com","de.goanimate.com","br.goanimate.com","tooncreator.cartoonnetworkhq.com","prelaunch.tooncreator.cartoonnetworkhq.com","staging.goanimate.org","staging.goanimate.com","cn.goanimate.com","goanimate.cartoonnetworkhq.org","lightspeed.goanimate.com","staging.school.goanimate.org","*.goanimate4schools.com","goanimate4schools.com","lightspeed.goanimate4schools.com","staging-school-cdn.com","sandbox.schoology.goanimate.com","schoology.goanimate4schools.com");
      }
      
      private var _243881267_background:Image;
      
      private var _1731027309_btnChar:Button;
      
      private var _2122106277_btnClose:IconTextButton;
      
      private var _53440340_btnPopSubmit:Button;
      
      private var _1340917080_cbType:ComboBox;
      
      private var _2107295562_cboxChars:ComboBox;
      
      private var _2104405815_cboxFlash:ArrayCollection;
      
      private var _725271361_cboxImages:ArrayCollection;
      
      private var _2097831927_cboxMovie:ArrayCollection;
      
      private var _436530293_cboxSounds:ArrayCollection;
      
      private var _46173988_charArray:ArrayCollection;
      
      private var _589894064_ckPublic:CheckBox;
      
      private var _1579377989_flashUI:FlashWindow;
      
      private var _1436421026_flashs:ObjectProxy;
      
      private var _1496793298_homeUI:Canvas;
      
      private var _24809488_imageUI:ImageWindow;
      
      private var _1523220375_images:ObjectProxy;
      
      public var _importer_Label4:Label;
      
      public var _importer_Label5:Label;
      
      public var _importer_Label6:Label;
      
      private var _1868749467_labelTag:Label;
      
      private var _2096658579_labelTag2:Label;
      
      private var _571653789_labelTitle:Label;
      
      private var _1472048409_logo1:Image;
      
      private var _1472048408_logo2:Image;
      
      private var _1472048407_logo3:Image;
      
      private var _1472048406_logo4:Image;
      
      private var _1290289627_logo4_beta:Image;
      
      private var _1657484456_mainWindow:Canvas;
      
      private var _1640211554_movies:ObjectProxy;
      
      private var _2080614473_pleaseEnterTitle:Label;
      
      private var _715252458_popAlert:Canvas;
      
      private var _717109126_popClose:IconTextButton;
      
      private var _814129551_popUpAlert:Label;
      
      private var _1325315106_popWindow:Canvas;
      
      private var _973409099_popWindowCover:Canvas;
      
      private var _336229028_soundUI:SoundsWindow;
      
      private var _1811961443_sounds:ObjectProxy;
      
      private var _1391325653_txtAlert:Text;
      
      private var _1479194791_txtChar:TextInput;
      
      private var _1479694698_txtTags:TextInput;
      
      private var _1373853913_txtTitle:TextInput;
      
      private var _1483959536_videoUI:FlashWindow;
      
      private var _1900203611_vsHome:ViewStack;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _console:IConsoleImportable;
      
      private var _status:Boolean = false;
      
      private var _type:String = "";
      
      private var _subtype:String;
      
      private var _tags:String;
      
      private var _published:Boolean;
      
      private var _title:String;
      
      private var timer:Timer;
      
      private var _charName:String;
      
      private var _pendingType:String;
      
      private var _charID:String;
      
      private var _oldChar:Boolean;
      
      private var _222757124_hasConsole:Boolean;
      
      private var _94436_bg:Number = 0.4;
      
      private var _ready:Boolean = false;
      
      private var _1554253136application:Object;
      
      private var ttsex:String;
      
      private var _popReturn:Function;
      
      private var _ckPublicVal:Number = -1;
      
      private var _allowPublicUpload:Boolean = true;
      
      mx_internal var _importer_StylesInit_done:Boolean = false;
      
      private var _embed_mxml_styles_ico_video_swf_2115523593:Class;
      
      private var _embed_mxml_importer_ico_bg_swf_1668914773:Class;
      
      private var _embed_mxml_importer_ico_beta_swf_739589577:Class;
      
      private var _embed_mxml_importer_ico_video_swf_2136645207:Class;
      
      private var _embed_mxml_styles_ico_other_prop_swf_1388190547:Class;
      
      private var _embed_mxml_styles_ico_char_swf_1673528747:Class;
      
      private var _embed_mxml_styles_ico_fx_swf_1430339437:Class;
      
      private var _embed_mxml_styles_ico_bg_swf_1524448427:Class;
      
      private var _embed_mxml_importer_bg_1_swf_1344451397:Class;
      
      private var _embed_mxml_importer_ico_music_swf_255500147:Class;
      
      private var _embed_mxml_importer_ico_flash_swf_1320201335:Class;
      
      private var _embed_mxml_styles_ico_music_swf_2098773037:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function importer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Module,
            "events":{
               "preinitialize":"___importer_Module1_preinitialize",
               "creationComplete":"___importer_Module1_creationComplete"
            },
            "stylesFactory":function():void
            {
               this.backgroundColor = 14540253;
            },
            "propertiesFactory":function():Object
            {
               return {
                  "creationPolicy":"none",
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Canvas,
                     "id":"_mainWindow",
                     "stylesFactory":function():void
                     {
                        this.backgroundAlpha = 0;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "horizontalScrollPolicy":"off",
                           "verticalScrollPolicy":"off",
                           "width":723,
                           "height":517,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Image,
                              "id":"_background",
                              "stylesFactory":function():void
                              {
                                 this.horizontalAlign = "center";
                                 this.verticalAlign = "middle";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "source":_embed_mxml_importer_bg_1_swf_1344451397,
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "scaleContent":true,
                                    "maintainAspectRatio":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "id":"_homeUI",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":TabBar,
                                       "stylesFactory":function():void
                                       {
                                          this.horizontalGap = 22;
                                          this.tabWidth = 152;
                                          this.fontSize = 14;
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":26,
                                             "y":67,
                                             "percentWidth":100,
                                             "height":38,
                                             "dataProvider":"_vsHome",
                                             "buttonMode":true
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":ViewStack,
                                       "id":"_vsHome",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "percentHeight":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":ImageWindow,
                                                "id":"_imageUI",
                                                "events":{"creationComplete":"___imageUI_creationComplete"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "percentWidth":100,
                                                      "percentHeight":100
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":SoundsWindow,
                                                "id":"_soundUI",
                                                "events":{"creationComplete":"___soundUI_creationComplete"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "percentWidth":100,
                                                      "percentHeight":100
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":FlashWindow,
                                                "id":"_flashUI",
                                                "events":{"creationComplete":"___flashUI_creationComplete"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "percentWidth":100,
                                                      "percentHeight":100
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":FlashWindow,
                                                "id":"_videoUI",
                                                "events":{"creationComplete":"___videoUI_creationComplete"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "percentWidth":100,
                                                      "percentHeight":100
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"_logo1",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml_importer_ico_bg_swf_1668914773,
                                             "maintainAspectRatio":true,
                                             "x":16,
                                             "y":59,
                                             "visible":true,
                                             "scaleX":0.7,
                                             "scaleY":0.7
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"_logo2",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml_importer_ico_music_swf_255500147,
                                             "maintainAspectRatio":true,
                                             "x":186,
                                             "y":58,
                                             "visible":true,
                                             "scaleX":0.7,
                                             "scaleY":0.7
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"_logo3",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml_importer_ico_flash_swf_1320201335,
                                             "maintainAspectRatio":true,
                                             "x":356,
                                             "y":56,
                                             "visible":true,
                                             "scaleX":0.7,
                                             "scaleY":0.7
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"_logo4",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml_importer_ico_video_swf_2136645207,
                                             "maintainAspectRatio":true,
                                             "x":526,
                                             "y":56,
                                             "visible":true,
                                             "scaleX":0.7,
                                             "scaleY":0.7
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Image,
                                       "id":"_logo4_beta",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "source":_embed_mxml_importer_ico_beta_swf_739589577,
                                             "maintainAspectRatio":true,
                                             "x":656,
                                             "y":56,
                                             "visible":true,
                                             "scaleX":1,
                                             "scaleY":1
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "y":0,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Label,
                                                "id":"_labelTitle",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "styleName":"title",
                                                      "horizontalCenter":0
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":IconTextButton,
                              "id":"_btnClose",
                              "events":{"click":"___btnClose_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "right":5,
                                    "y":2,
                                    "styleName":"btnCloseTop",
                                    "labelPlacement":"left"
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Canvas,
                     "id":"_popWindowCover",
                     "stylesFactory":function():void
                     {
                        this.backgroundColor = 13421772;
                        this.backgroundAlpha = 0.55;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentHeight":100,
                           "percentWidth":100,
                           "visible":false
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Canvas,
                     "id":"_popWindow",
                     "events":{
                        "show":"___popWindow_show",
                        "hide":"___popWindow_hide"
                     },
                     "stylesFactory":function():void
                     {
                        this.shadowDistance = 5;
                        this.backgroundColor = 16777215;
                        this.cornerRadius = 6;
                        this.borderStyle = "solid";
                        this.borderThickness = 3;
                        this.themeColor = 10724259;
                        this.borderColor = 11053224;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "height":252,
                           "width":400,
                           "verticalScrollPolicy":"off",
                           "horizontalScrollPolicy":"off",
                           "visible":false,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Label,
                              "id":"_popUpAlert",
                              "stylesFactory":function():void
                              {
                                 this.fontWeight = "bold";
                                 this.color = 16711680;
                                 this.fontSize = 18;
                                 this.textAlign = "right";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":99.5,
                                    "y":28,
                                    "visible":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":ComboBox,
                              "id":"_cbType",
                              "events":{
                                 "dataChange":"___cbType_dataChange",
                                 "change":"___cbType_change"
                              },
                              "stylesFactory":function():void
                              {
                                 this.themeColor = 16742400;
                                 this.fontSize = 17;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":99.5,
                                    "y":50,
                                    "height":30,
                                    "width":212
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":TextInput,
                              "id":"_txtTitle",
                              "events":{"change":"___txtTitle_change"},
                              "stylesFactory":function():void
                              {
                                 this.themeColor = 16742400;
                                 this.fontSize = 16;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":99.5,
                                    "y":97,
                                    "editable":true,
                                    "enabled":true,
                                    "width":212,
                                    "height":30
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":TextInput,
                              "id":"_txtChar",
                              "stylesFactory":function():void
                              {
                                 this.fontSize = 16;
                                 this.themeColor = 16742400;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":99.5,
                                    "y":142,
                                    "editable":true,
                                    "width":212,
                                    "height":30,
                                    "visible":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":TextInput,
                              "id":"_txtTags",
                              "stylesFactory":function():void
                              {
                                 this.fontSize = 16;
                                 this.themeColor = 16742400;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":99.5,
                                    "y":142,
                                    "editable":true,
                                    "width":212,
                                    "height":30
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":ComboBox,
                              "id":"_cboxChars",
                              "stylesFactory":function():void
                              {
                                 this.fontSize = 13;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":99.5,
                                    "y":142,
                                    "width":212,
                                    "height":30,
                                    "visible":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Label,
                              "id":"_labelTag",
                              "stylesFactory":function():void
                              {
                                 this.fontWeight = "bold";
                                 this.fontSize = 18;
                                 this.textAlign = "right";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":23.5,
                                    "y":143
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Label,
                              "id":"_importer_Label4",
                              "stylesFactory":function():void
                              {
                                 this.fontWeight = "bold";
                                 this.fontSize = 18;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":23.5,
                                    "y":98
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Label,
                              "id":"_importer_Label5",
                              "stylesFactory":function():void
                              {
                                 this.fontSize = 18;
                                 this.fontWeight = "bold";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":23.5,
                                    "y":52.5
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Label,
                              "id":"_importer_Label6",
                              "stylesFactory":function():void
                              {
                                 this.fontSize = 19;
                                 this.fontWeight = "bold";
                                 this.color = 0;
                                 this.textDecoration = "none";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":9,
                                    "y":3
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Label,
                              "id":"_pleaseEnterTitle",
                              "stylesFactory":function():void
                              {
                                 this.fontSize = 17;
                                 this.color = 9145227;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":162.5,
                                    "y":105,
                                    "visible":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Label,
                              "id":"_labelTag2",
                              "stylesFactory":function():void
                              {
                                 this.fontWeight = "bold";
                                 this.fontSize = 18;
                                 this.textAlign = "right";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":23.5,
                                    "y":193,
                                    "visible":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"_btnChar",
                              "events":{"click":"___btnChar_click"},
                              "stylesFactory":function():void
                              {
                                 this.fontSize = 16;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":319.5,
                                    "y":142,
                                    "height":30,
                                    "width":65,
                                    "visible":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":CheckBox,
                              "id":"_ckPublic",
                              "stylesFactory":function():void
                              {
                                 this.fontWeight = "normal";
                                 this.fontSize = 17;
                                 this.themeColor = 16742400;
                                 this.color = 0;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":111.5,
                                    "y":190,
                                    "selected":false,
                                    "visible":false,
                                    "enabled":true
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"_btnPopSubmit",
                              "events":{"click":"___btnPopSubmit_click"},
                              "stylesFactory":function():void
                              {
                                 this.themeColor = 16742400;
                                 this.fontSize = 18;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":243.5,
                                    "y":195,
                                    "enabled":true,
                                    "width":93,
                                    "buttonMode":true
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":IconTextButton,
                              "id":"_popClose",
                              "events":{"click":"___popClose_click"},
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "right":5,
                                    "y":0,
                                    "visible":true,
                                    "styleName":"btnCloseTop",
                                    "labelPlacement":"left"
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Canvas,
                     "id":"_popAlert",
                     "events":{"click":"___popAlert_click"},
                     "stylesFactory":function():void
                     {
                        this.shadowDirection = "center";
                        this.shadowDistance = 8;
                        this.backgroundAlpha = 0;
                        this.cornerRadius = 6;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "buttonMode":true,
                           "visible":false,
                           "height":130,
                           "width":400,
                           "horizontalScrollPolicy":"off",
                           "verticalScrollPolicy":"off",
                           "mouseChildren":false,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Image,
                              "stylesFactory":function():void
                              {
                                 this.horizontalAlign = "center";
                                 this.verticalAlign = "middle";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "source":_embed_mxml_importer_bg_1_swf_1344451397,
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "scaleContent":true,
                                    "maintainAspectRatio":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Text,
                              "id":"_txtAlert",
                              "stylesFactory":function():void
                              {
                                 this.textAlign = "center";
                                 this.fontSize = 20;
                                 this.fontWeight = "bold";
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "x":0,
                                    "y":40,
                                    "percentWidth":100,
                                    "selectable":false
                                 };
                              }
                           })]
                        };
                     }
                  })]
               };
            }
         });
         this._1554253136application = FlexGlobals.topLevelApplication;
         this._embed_mxml_styles_ico_video_swf_2115523593 = importer__embed_mxml_styles_ico_video_swf_2115523593;
         this._embed_mxml_importer_ico_bg_swf_1668914773 = importer__embed_mxml_importer_ico_bg_swf_1668914773;
         this._embed_mxml_importer_ico_beta_swf_739589577 = importer__embed_mxml_importer_ico_beta_swf_739589577;
         this._embed_mxml_importer_ico_video_swf_2136645207 = importer__embed_mxml_importer_ico_video_swf_2136645207;
         this._embed_mxml_styles_ico_other_prop_swf_1388190547 = importer__embed_mxml_styles_ico_other_prop_swf_1388190547;
         this._embed_mxml_styles_ico_char_swf_1673528747 = importer__embed_mxml_styles_ico_char_swf_1673528747;
         this._embed_mxml_styles_ico_fx_swf_1430339437 = importer__embed_mxml_styles_ico_fx_swf_1430339437;
         this._embed_mxml_styles_ico_bg_swf_1524448427 = importer__embed_mxml_styles_ico_bg_swf_1524448427;
         this._embed_mxml_importer_bg_1_swf_1344451397 = importer__embed_mxml_importer_bg_1_swf_1344451397;
         this._embed_mxml_importer_ico_music_swf_255500147 = importer__embed_mxml_importer_ico_music_swf_255500147;
         this._embed_mxml_importer_ico_flash_swf_1320201335 = importer__embed_mxml_importer_ico_flash_swf_1320201335;
         this._embed_mxml_styles_ico_music_swf_2098773037 = importer__embed_mxml_styles_ico_music_swf_2098773037;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._importer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_importerWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return importer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.layout = "absolute";
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.creationPolicy = "none";
         this._importer_ArrayCollection2_i();
         this._importer_ArrayCollection4_i();
         this._importer_ArrayCollection1_i();
         this._importer_ArrayCollection3_i();
         this._importer_ArrayCollection5_i();
         this._importer_ObjectProxy10_i();
         this._importer_ObjectProxy1_i();
         this._importer_ObjectProxy16_i();
         this._importer_ObjectProxy5_i();
         this.addEventListener("preinitialize",this.___importer_Module1_preinitialize);
         this.addEventListener("creationComplete",this.___importer_Module1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         importer._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.backgroundColor = 14540253;
         };
         mx_internal::_importer_StylesInit();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function init(param1:IConsoleImportable) : void
      {
         if(param1)
         {
            this._console = param1;
            this._hasConsole = true;
         }
      }
      
      private function loadClientLocale() : void
      {
         Util.loadClientLocale("import",this.onClientLocaleComplete);
      }
      
      private function onClientLocaleComplete(param1:Event) : void
      {
         this.loadClientTheme();
      }
      
      private function loadClientTheme() : void
      {
         var _loc1_:AppConfigManager = AppConfigManager.instance;
         var _loc2_:String = _loc1_.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_CODE);
         var _loc3_:String = _loc1_.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE);
         var _loc4_:Array = new Array();
         var _loc5_:Array = new Array();
         var _loc6_:Array = new Array();
         _loc4_.push("importer");
         _loc5_.push(_loc3_);
         _loc6_.push(_loc2_);
         _loc4_.push("importer");
         _loc5_.push("lang_common");
         _loc6_.push(_loc2_);
         Util.loadClientTheming(_loc4_,_loc5_,_loc6_,this.onClientThemeComplete);
      }
      
      private function onClientThemeComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onClientThemeComplete);
         createComponentsFromDescriptors();
      }
      
      private function initPanel(param1:Function) : void
      {
         param1(this);
      }
      
      private function initUI() : void
      {
         if(UtilUser.userType == UtilUser.BASIC_USER || UtilSite.siteId == UtilSite.ED)
         {
            this._vsHome.removeChild(this._flashUI);
            this._vsHome.removeChild(this._videoUI);
            this._logo3.visible = false;
            this._logo4.visible = false;
            this._logo4_beta.visible = false;
         }
         else if(UtilSite.siteId == UtilSite.SKOLETUBE)
         {
            this._vsHome.removeChild(this._videoUI);
            this._logo4.visible = false;
            this._logo4_beta.visible = false;
         }
      }
      
      private function done() : void
      {
         this._ready = true;
         var _loc1_:String = FlexGlobals.topLevelApplication.parameters["standalone"];
         if(_loc1_ != null && _loc1_ == "1")
         {
            this._bg = 0;
         }
         this.updateArrayLabel(this._cboxFlash);
         this.updateArrayLabel(this._cboxImages);
         this.updateArrayLabel(this._cboxSounds);
         this.initUI();
         this._cboxFlash.source = this._cboxFlash.source.filter(this.flashTypeFilter);
         if(this._pendingType)
         {
            this.gotoPanel(this._pendingType);
         }
      }
      
      public function removeHandHeld() : void
      {
      }
      
      private function flashTypeFilter(param1:*, param2:int, param3:Array) : Boolean
      {
         if(param1.id == "8")
         {
            return false;
         }
         if(param1.id == "9" && !UtilUser.hasBetaFeatures())
         {
            return false;
         }
         return true;
      }
      
      private function updateArrayLabel(param1:ArrayCollection) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            param1.getItemAt(_loc2_).label = UtilDict.toDisplay("import",param1.getItemAt(_loc2_).label);
            _loc2_++;
         }
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function set title(param1:String) : void
      {
         this._title = param1;
      }
      
      public function get tags() : String
      {
         return this._tags;
      }
      
      public function set tags(param1:String) : void
      {
         this._tags = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get subtype() : String
      {
         return this._subtype;
      }
      
      public function set subtype(param1:String) : void
      {
         this._subtype = param1;
      }
      
      public function get isPublished() : Boolean
      {
         return this._published;
      }
      
      public function set isPublished(param1:Boolean) : void
      {
         this._published = param1;
      }
      
      public function get char() : String
      {
         return this._charName;
      }
      
      public function get charId() : String
      {
         if(this._charID == "0")
         {
            this._charID = "";
         }
         return this._charID;
      }
      
      public function set oldChar(param1:Boolean) : void
      {
         this._oldChar = param1;
      }
      
      public function get oldChar() : Boolean
      {
         return this._oldChar;
      }
      
      public function hasConsole() : Boolean
      {
         return this._hasConsole;
      }
      
      public function get licensorName() : String
      {
         return this._console.currentLicensorName;
      }
      
      public function gotoPanel(param1:String) : void
      {
         if(!this._ready)
         {
            this._pendingType = param1;
            return;
         }
         switch(param1)
         {
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC:
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT:
            case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER:
            case AnimeConstants.ASSET_TYPE_SOUND:
               this._vsHome.selectedChild = this._soundUI;
               break;
            case AnimeConstants.ASSET_TYPE_PROP:
            case AnimeConstants.ASSET_TYPE_PROP_HELD_BY_CHAR:
            case AnimeConstants.ASSET_TYPE_PROP_PLACEABLE:
            case AnimeConstants.ASSET_TYPE_PROP_HEAD:
            case AnimeConstants.ASSET_TYPE_BG:
               this._vsHome.selectedChild = this._imageUI;
               break;
            case AnimeConstants.ASSET_TYPE_PROP_VIDEO:
               this._vsHome.selectedChild = this._videoUI;
               break;
            default:
               this._vsHome.selectedChild = this._imageUI;
         }
         if(this._console)
         {
            this._console.importerInitComplete();
         }
      }
      
      public function setButtonStatus(param1:Boolean, param2:Boolean = true) : void
      {
         if(param1 && param2)
         {
            CursorManager.removeAllCursors();
         }
         else if(param2)
         {
            CursorManager.setBusyCursor();
         }
         if(this._popWindow.visible)
         {
         }
         this.requestLoadStatus(false,true);
         if(this._popClose != null)
         {
            this._popClose.enabled = param1;
         }
         if(this._btnPopSubmit != null)
         {
            this._btnPopSubmit.enabled = param1;
         }
      }
      
      private function getUserChars(param1:ArrayCollection) : void
      {
         var _loc2_:URLRequest = null;
         var _loc3_:URLVariables = new URLVariables();
         this.addFlashVarsToURLvar(_loc3_);
         _loc2_ = new URLRequest(ServerConstants.ACTION_GET_CHAR_LIST);
         _loc2_.data = _loc3_;
         _loc2_.method = URLRequestMethod.POST;
         var _loc4_:URLStream;
         (_loc4_ = new URLStream()).addEventListener(Event.COMPLETE,this.onGetListComplete);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.error);
         _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.error);
         _loc4_.load(_loc2_);
      }
      
      private function onGetListComplete(param1:Event) : void
      {
         var _loc6_:String = null;
         var _loc7_:XMLList = null;
         var _loc8_:Array = null;
         var _loc2_:URLStream = param1.target as URLStream;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc4_);
         var _loc5_:String = _loc4_.toString();
         if(_loc3_ == 48)
         {
            _loc7_ = new XML(_loc5_).child("*");
            _loc8_ = this.xmlListToArray(_loc7_);
            this._charArray = new ArrayCollection(_loc8_);
            if(this._charArray.length == 0)
            {
               this._charArray.addItem({
                  "id":"0",
                  "label":UtilDict.toDisplay("import","import_nochar")
               });
            }
            CursorManager.removeBusyCursor();
         }
         else
         {
            this.error(null);
            CursorManager.removeBusyCursor();
         }
      }
      
      private function xmlListToArray(param1:XMLList) : Array
      {
         var _loc7_:Object = null;
         var _loc2_:Array = new Array();
         var _loc3_:XMLList = param1.attribute("id");
         var _loc4_:XMLList = param1.attribute("name");
         var _loc5_:XMLList = param1.attribute("default");
         var _loc6_:XMLList = param1.attribute("thumb");
         var _loc8_:int = 0;
         while(_loc8_ < param1.length())
         {
            _loc7_ = {
               "id":_loc3_[_loc8_],
               "label":_loc4_[_loc8_],
               "name":_loc4_[_loc8_],
               "daction":_loc5_[_loc8_],
               "thumb":_loc6_[_loc8_]
            };
            _loc2_.push(_loc7_);
            _loc8_++;
         }
         return _loc2_;
      }
      
      public function addToTray(param1:ByteArray, param2:XML) : void
      {
         if(this._console == null)
         {
            this.success();
         }
      }
      
      public function onLoadAssetCompleteHandler(param1:Event) : void
      {
         this.success();
      }
      
      public function onSentSoundCompleteHandler(param1:Event) : void
      {
         this.success();
      }
      
      public function onUploadCustomAssetComplete(param1:Event) : void
      {
         var _loc2_:String = null;
         if(this._console != null)
         {
            if(param1 != null)
            {
               if(param1.type == DataEvent.UPLOAD_COMPLETE_DATA)
               {
                  _loc2_ = (param1 as DataEvent).data;
               }
               else
               {
                  _loc2_ = (param1.target as URLLoader).data;
               }
            }
            this._console.customAssetUploadCompleteHandler(_loc2_,this.type);
         }
         else
         {
            this.success();
         }
      }
      
      public function success() : void
      {
         this.show(UtilDict.toDisplay("import","import_success"),UtilDict.toDisplay("import","import_done"),false);
         this.setButtonStatus(true);
         this._popWindow.visible = false;
         this.tags = "";
         this.title = "";
         this._txtChar.text = "";
      }
      
      private function requestLoadStatus(param1:Boolean, param2:Boolean = false) : void
      {
         if(this._console != null)
         {
            this._console.requestLoadStatus(param1,param2);
         }
      }
      
      public function playScene(param1:Boolean = true) : void
      {
         if(this._console != null)
         {
            this._console.playScene(param1);
         }
      }
      
      public function appParam(param1:String) : String
      {
         var _loc2_:String = FlexGlobals.topLevelApplication.parameters[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.toString();
      }
      
      public function show(param1:String, param2:String = null, param3:Boolean = false) : void
      {
         var text:String = param1;
         var title:String = param2;
         var alert:Boolean = param3;
         if(alert)
         {
            this._txtAlert.htmlText = "<font color=\'#D00303\'>" + text + "</font>";
         }
         else
         {
            this._txtAlert.text = text;
         }
         this._popWindowCover.visible = true;
         this._popAlert.visible = true;
         this.timer = new Timer(2500,1);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,function():void
         {
            _popAlert.visible = false;
            _popWindowCover.visible = false;
            setButtonStatus(true);
         });
         this.timer.start();
      }
      
      public function thumbtrayCommand(param1:String, param2:Object) : void
      {
         if(this._console != null)
         {
            this._console.thumbTrayCommand(param1,param2 as String);
         }
      }
      
      public function addFlashVarsToURLvar(param1:URLVariables) : void
      {
         Util.addFlashVarsToURLvar(param1);
      }
      
      public function trim(param1:String) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.length - 1;
         if(_loc3_ < 1)
         {
            return "";
         }
         while(param1.charAt(_loc2_) < "!" && _loc2_ < param1.length)
         {
            _loc2_++;
         }
         while(param1.charAt(_loc3_) < "!" && _loc3_ >= 0)
         {
            _loc3_--;
         }
         if(_loc3_ < _loc2_)
         {
            return "";
         }
         return param1.substring(_loc2_,_loc3_ + 1);
      }
      
      public function error(param1:Event = null) : void
      {
         this.show(UtilDict.toDisplay("import","import_errtryagain"),UtilDict.toDisplay("import","import_errtitle"),true);
      }
      
      private function onCloseHandler() : void
      {
         this.close();
      }
      
      public function close() : void
      {
         if(this._console != null)
         {
            this.setButtonStatus(true);
            if(this._txtTags != null)
            {
               this._txtTags.text = "";
            }
            if(this._txtTitle != null)
            {
               this._txtTitle.text = "";
            }
            if(this._popWindow != null)
            {
               this._popWindow.visible = false;
            }
            if(this._popWindowCover != null)
            {
               this._popWindowCover.visible = false;
            }
            this.oldChar = false;
            this.playScene(true);
            this._console.invisibleImporter();
         }
      }
      
      private function initPopUp() : void
      {
         var _loc1_:UtilHashArray = Util.getFlashVar();
         var _loc2_:String = _loc1_.getValueByKey("uplp");
         if(UtilLicense.isSchoolEnvironment() && (!_loc2_ || _loc2_ != "1"))
         {
            this._allowPublicUpload = false;
            this._ckPublic.selected = false;
            this._ckPublic.visible = false;
         }
      }
      
      public function showPopUp(param1:Function, param2:String) : void
      {
         this._popReturn = param1;
         this._cbType.enabled = true;
         if(this._cbType != null)
         {
            this._cbType.selectedIndex = 0;
         }
         this._popWindow.visible = true;
         this._popWindowCover.visible = true;
         if(param2 == "uploads")
         {
            this._cbType.dataProvider = this._cboxSounds;
            this._txtTags.text = this.tags;
            this._type = AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
            this._txtTitle.text = this.title;
            if(this._ckPublicVal == -1)
            {
               this._ckPublicVal = Number(this._ckPublic.selected);
            }
            this._ckPublic.selected = false;
            this._ckPublic.enabled = false;
         }
         else if(param2 == "uploadi")
         {
            this._txtTags.text = this.tags;
            this._txtTitle.text = this.title;
            this._cbType.dataProvider = this._cboxImages;
            this._type = AnimeConstants.ASSET_TYPE_BG;
            if(this._ckPublicVal != -1)
            {
               this._ckPublic.selected = Boolean(this._ckPublicVal);
               this._ckPublicVal = -1;
            }
            this._ckPublic.selected = false;
            this._ckPublic.enabled = true;
         }
         else if(param2 == "flash")
         {
            this._txtTitle.text = this.title;
            this._txtTags.text = this.tags;
            this._type = AnimeConstants.ASSET_TYPE_BG;
            this._charArray.removeAll();
            this._cbType.dataProvider = this._cboxFlash;
            if(this._ckPublicVal != -1)
            {
               this._ckPublic.selected = Boolean(this._ckPublicVal);
               this._ckPublicVal = -1;
            }
            this._ckPublic.selected = false;
            this._ckPublic.enabled = true;
         }
         else if(param2 == "video")
         {
            this._txtTitle.text = this.title;
            this._txtTags.text = this.tags;
            this._type = AnimeConstants.ASSET_TYPE_PROP_VIDEO;
            this._charArray.removeAll();
            this._cbType.dataProvider = this._cboxMovie;
            this._cbType.selectedIndex = 1;
            this._cbType.enabled = false;
            this._ckPublic.selected = false;
            this._ckPublic.enabled = false;
         }
         this.initPopUp();
      }
      
      private function onTitleChangeHandler() : void
      {
         if(this._txtTitle.length == 0)
         {
            this._pleaseEnterTitle.visible = true;
         }
         else
         {
            this._pleaseEnterTitle.visible = false;
         }
      }
      
      private function onPopReturn() : void
      {
         if(this.trim(this._txtTitle.text).length < 2)
         {
            this._pleaseEnterTitle.visible = true;
         }
         else if(this._cbType.selectedItem.type == "")
         {
            this._popUpAlert.text = UtilDict.toDisplay("import","import_alertassettype");
            this._popUpAlert.visible = true;
         }
         else if(this._cbType.selectedItem["id"] == "8" && this._btnChar.label == "New" && this._cboxChars.selectedItem["id"] == "0")
         {
            this.show(UtilDict.toDisplay("import","import_alertnewchar"),UtilDict.toDisplay("import","import_nochar"),true);
         }
         else
         {
            this.setButtonStatus(false);
            this._popWindow.visible = false;
            this.title = this._txtTitle.text;
            this.isPublished = false;
            this.tags = this._txtTags.text;
            if(this.trim(this._txtTags.text).length < 2)
            {
               this.tags = this._txtTitle.text;
            }
            if(this.type == AnimeConstants.ASSET_TYPE_CHAR)
            {
               this._charName = this._txtChar.text;
               this._charID = this._cboxChars.selectedItem["id"];
               this._btnChar.label == UtilDict.toDisplay("import","import_newchar");
               this.oldChar = true;
            }
            else
            {
               this.oldChar = false;
            }
            if(this._btnChar.label == UtilDict.toDisplay("import","import_oldchar"))
            {
               this.onCharClick();
            }
            this._txtTags.visible = true;
            this._cboxChars.visible = false;
            this._labelTag.text = UtilDict.toDisplay("import","import_tags");
            this._labelTag.x = 23.5;
            this._ckPublic.visible = false;
            this._btnChar.visible = false;
            if(this.type == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC || this.type == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT || this.type == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER)
            {
               this._subtype = this.type;
               this.type = AnimeConstants.ASSET_TYPE_SOUND;
            }
            this._popReturn();
         }
      }
      
      private function onTypeChange() : void
      {
         if(!(this._cbType.selectedItem is String))
         {
            if(this._cbType.selectedItem["id"] == "8")
            {
               this._txtTags.visible = false;
               this._cboxChars.visible = true;
               this._labelTag.text = UtilDict.toDisplay("import","import_char");
               this._labelTag.x -= 25;
               CursorManager.setBusyCursor();
               this.getUserChars(this._charArray);
               this._ckPublic.visible = false;
               this._ckPublic.selected = false;
               this._btnChar.visible = true;
            }
            else
            {
               if(this._btnChar.label == UtilDict.toDisplay("import","import_oldchar"))
               {
                  this.onCharClick();
               }
               this._txtTags.visible = true;
               this._cboxChars.visible = false;
               this._labelTag.text = UtilDict.toDisplay("import","import_tags");
               this._labelTag.x = 23.5;
               this._ckPublic.visible = false;
               this._btnChar.visible = false;
            }
            this._type = this._cbType.selectedItem["type"];
            this._subtype = this._cbType.selectedItem["subber"];
         }
         else
         {
            this._type = "";
            this._subtype = "";
         }
         this._popUpAlert.visible = false;
      }
      
      private function onCharClick() : void
      {
         if(this._btnChar.label == UtilDict.toDisplay("import","import_newchar"))
         {
            this._cboxChars.visible = false;
            this._txtChar.visible = true;
            this._txtTags.visible = true;
            this._txtTags.text = "";
            this._txtChar.text = UtilDict.toDisplay("import","import_newcharname");
            this._btnChar.label = UtilDict.toDisplay("import","import_oldchar");
            this._txtTags.y += 50;
            this._labelTag2.visible = true;
            this._popWindow.height += 50;
            this._btnPopSubmit.y += 40;
         }
         else
         {
            this._cboxChars.visible = true;
            this._txtChar.visible = false;
            this._txtTags.visible = false;
            this._txtTags.text = "";
            this._txtChar.text = "";
            this._labelTag2.visible = false;
            this._txtTags.y -= 50;
            this._btnPopSubmit.y -= 40;
            this._btnChar.label = UtilDict.toDisplay("import","import_newchar");
            this._popWindow.height -= 50;
         }
      }
      
      private function _importer_ArrayCollection2_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.initialized(this,"_cboxFlash");
         this._cboxFlash = _loc1_;
         BindingManager.executeBindings(this,"_cboxFlash",this._cboxFlash);
         return _loc1_;
      }
      
      private function _importer_ArrayCollection4_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.initialized(this,"_cboxImages");
         this._cboxImages = _loc1_;
         BindingManager.executeBindings(this,"_cboxImages",this._cboxImages);
         return _loc1_;
      }
      
      private function _importer_ArrayCollection1_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.initialized(this,"_cboxMovie");
         this._cboxMovie = _loc1_;
         BindingManager.executeBindings(this,"_cboxMovie",this._cboxMovie);
         return _loc1_;
      }
      
      private function _importer_ArrayCollection3_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.initialized(this,"_cboxSounds");
         this._cboxSounds = _loc1_;
         BindingManager.executeBindings(this,"_cboxSounds",this._cboxSounds);
         return _loc1_;
      }
      
      private function _importer_ArrayCollection5_i() : ArrayCollection
      {
         var _loc1_:ArrayCollection = new ArrayCollection();
         _loc1_.initialized(this,"_charArray");
         this._charArray = _loc1_;
         BindingManager.executeBindings(this,"_charArray",this._charArray);
         return _loc1_;
      }
      
      private function _importer_ObjectProxy10_i() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.item = [this._importer_ObjectProxy11_c(),this._importer_ObjectProxy12_c(),this._importer_ObjectProxy13_c(),this._importer_ObjectProxy14_c(),this._importer_ObjectProxy15_c()];
         this._flashs = _loc1_;
         BindingManager.executeBindings(this,"_flashs",this._flashs);
         return _loc1_;
      }
      
      private function _importer_ObjectProxy11_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 0;
         _loc1_.label = null;
         _loc1_.type = "";
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy12_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 13;
         _loc1_.label = null;
         _loc1_.type = null;
         _loc1_.icon = this._embed_mxml_styles_ico_other_prop_swf_1388190547;
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy13_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 10;
         _loc1_.label = null;
         _loc1_.type = null;
         _loc1_.icon = this._embed_mxml_styles_ico_bg_swf_1524448427;
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy14_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 8;
         _loc1_.label = null;
         _loc1_.type = null;
         _loc1_.icon = this._embed_mxml_styles_ico_char_swf_1673528747;
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy15_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 9;
         _loc1_.label = null;
         _loc1_.type = null;
         _loc1_.icon = this._embed_mxml_styles_ico_fx_swf_1430339437;
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy1_i() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.item = [this._importer_ObjectProxy2_c(),this._importer_ObjectProxy3_c(),this._importer_ObjectProxy4_c()];
         this._images = _loc1_;
         BindingManager.executeBindings(this,"_images",this._images);
         return _loc1_;
      }
      
      private function _importer_ObjectProxy2_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 0;
         _loc1_.label = null;
         _loc1_.type = "";
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy3_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 1;
         _loc1_.label = null;
         _loc1_.type = null;
         _loc1_.icon = this._embed_mxml_styles_ico_bg_swf_1524448427;
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy4_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 2;
         _loc1_.label = null;
         _loc1_.type = null;
         _loc1_.icon = this._embed_mxml_styles_ico_other_prop_swf_1388190547;
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy16_i() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.item = [this._importer_ObjectProxy17_c(),this._importer_ObjectProxy18_c()];
         this._movies = _loc1_;
         BindingManager.executeBindings(this,"_movies",this._movies);
         return _loc1_;
      }
      
      private function _importer_ObjectProxy17_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 0;
         _loc1_.label = null;
         _loc1_.type = "";
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy18_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 14;
         _loc1_.label = null;
         _loc1_.type = "{AnimeConstants.ASSET_TYPE_PROP_VIDEO";
         _loc1_.icon = this._embed_mxml_styles_ico_video_swf_2115523593;
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy5_i() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.item = [this._importer_ObjectProxy6_c(),this._importer_ObjectProxy7_c(),this._importer_ObjectProxy8_c(),this._importer_ObjectProxy9_c()];
         this._sounds = _loc1_;
         BindingManager.executeBindings(this,"_sounds",this._sounds);
         return _loc1_;
      }
      
      private function _importer_ObjectProxy6_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 0;
         _loc1_.label = null;
         _loc1_.type = "";
         _loc1_.subber = "";
         return _loc1_;
      }
      
      private function _importer_ObjectProxy7_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 4;
         _loc1_.label = null;
         _loc1_.type = null;
         _loc1_.icon = this._embed_mxml_styles_ico_music_swf_2098773037;
         _loc1_.subber = null;
         return _loc1_;
      }
      
      private function _importer_ObjectProxy8_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 5;
         _loc1_.label = null;
         _loc1_.type = null;
         _loc1_.icon = this._embed_mxml_styles_ico_music_swf_2098773037;
         _loc1_.subber = null;
         return _loc1_;
      }
      
      private function _importer_ObjectProxy9_c() : ObjectProxy
      {
         var _loc1_:ObjectProxy = new ObjectProxy();
         _loc1_.id = 6;
         _loc1_.label = null;
         _loc1_.type = null;
         _loc1_.icon = this._embed_mxml_styles_ico_music_swf_2098773037;
         _loc1_.subber = null;
         return _loc1_;
      }
      
      public function ___importer_Module1_preinitialize(param1:FlexEvent) : void
      {
         this.loadClientLocale();
      }
      
      public function ___importer_Module1_creationComplete(param1:FlexEvent) : void
      {
         this.done();
      }
      
      public function ___imageUI_creationComplete(param1:FlexEvent) : void
      {
         this.initPanel(this._imageUI.init);
      }
      
      public function ___soundUI_creationComplete(param1:FlexEvent) : void
      {
         this.initPanel(this._soundUI.init);
      }
      
      public function ___flashUI_creationComplete(param1:FlexEvent) : void
      {
         this.initPanel(this._flashUI.init);
      }
      
      public function ___videoUI_creationComplete(param1:FlexEvent) : void
      {
         this.initPanel(this._videoUI.init);
      }
      
      public function ___btnClose_click(param1:MouseEvent) : void
      {
         this.onCloseHandler();
      }
      
      public function ___popWindow_show(param1:FlexEvent) : void
      {
         this._popWindowCover.visible = true;
      }
      
      public function ___popWindow_hide(param1:FlexEvent) : void
      {
         this._cbType.selectedIndex = 0;
      }
      
      public function ___cbType_dataChange(param1:FlexEvent) : void
      {
         this.onTypeChange();
      }
      
      public function ___cbType_change(param1:ListEvent) : void
      {
         this.onTypeChange();
      }
      
      public function ___txtTitle_change(param1:Event) : void
      {
         this.onTitleChangeHandler();
      }
      
      public function ___btnChar_click(param1:MouseEvent) : void
      {
         this.onCharClick();
      }
      
      public function ___btnPopSubmit_click(param1:MouseEvent) : void
      {
         this.onPopReturn();
      }
      
      public function ___popClose_click(param1:MouseEvent) : void
      {
         this._popWindow.visible = false;
         this._popWindowCover.visible = false;
         this._cbType.selectedIndex = 0;
         this.onTypeChange();
      }
      
      public function ___popAlert_click(param1:MouseEvent) : void
      {
         this.timer.stop();
         this._popAlert.visible = false;
         this._popWindowCover.visible = false;
         this.setButtonStatus(true);
      }
      
      private function _importer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return _bg;
         },function(param1:Number):void
         {
            this.setStyle("backgroundAlpha",param1);
         },"this.backgroundAlpha");
         result[1] = new Binding(this,function():Number
         {
            return (application.width - 723) / 2;
         },null,"_mainWindow.x");
         result[2] = new Binding(this,function():Number
         {
            return (application.height - 517) / 2;
         },null,"_mainWindow.y");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_proptitle");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_imageUI.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_soundtitle");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_soundUI.label");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_flashtitle");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_flashUI.label");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","Videos");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_videoUI.label");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_maintitle");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_labelTitle.text");
         result[8] = new Binding(this,function():Boolean
         {
            return _hasConsole;
         },null,"_btnClose.visible");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Close");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnClose.label");
         result[10] = new Binding(this,function():Number
         {
            return this.width * 0.5 - 200;
         },null,"_popWindow.x");
         result[11] = new Binding(this,function():Number
         {
            return this.height * 0.5 - 126;
         },null,"_popWindow.y");
         result[12] = new Binding(this,null,null,"_cboxChars.dataProvider","_charArray");
         result[13] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_tags");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_labelTag.text");
         result[14] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_name");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_importer_Label4.text");
         result[15] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_type");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_importer_Label5.text");
         result[16] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_uploadinfo");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_importer_Label6.text");
         result[17] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_errentertitle");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_pleaseEnterTitle.text");
         result[18] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_tags");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_labelTag2.text");
         result[19] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_newchar");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnChar.label");
         result[20] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_public");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_ckPublic.label");
         result[21] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("import","import_upload");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_btnPopSubmit.label");
         result[22] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Close");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_popClose.label");
         result[23] = new Binding(this,function():Number
         {
            return this.width * 0.5 - 200;
         },null,"_popAlert.x");
         result[24] = new Binding(this,function():Number
         {
            return this.height * 0.5 - 50;
         },null,"_popAlert.y");
         result[25] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Please select a type:");
         },function(param1:*):void
         {
            _images.item[0].label = param1;
         },"_images.item[0].label");
         result[26] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Background");
         },function(param1:*):void
         {
            _images.item[1].label = param1;
         },"_images.item[1].label");
         result[27] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_BG;
         },function(param1:*):void
         {
            _images.item[1].type = param1;
         },"_images.item[1].type");
         result[28] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Prop");
         },function(param1:*):void
         {
            _images.item[2].label = param1;
         },"_images.item[2].label");
         result[29] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_PROP_PLACEABLE;
         },function(param1:*):void
         {
            _images.item[2].type = param1;
         },"_images.item[2].type");
         result[30] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Please select a type:");
         },function(param1:*):void
         {
            _sounds.item[0].label = param1;
         },"_sounds.item[0].label");
         result[31] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Sound - bg music");
         },function(param1:*):void
         {
            _sounds.item[1].label = param1;
         },"_sounds.item[1].label");
         result[32] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_SOUND;
         },function(param1:*):void
         {
            _sounds.item[1].type = param1;
         },"_sounds.item[1].type");
         result[33] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
         },function(param1:*):void
         {
            _sounds.item[1].subber = param1;
         },"_sounds.item[1].subber");
         result[34] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Sound - effect");
         },function(param1:*):void
         {
            _sounds.item[2].label = param1;
         },"_sounds.item[2].label");
         result[35] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_SOUND;
         },function(param1:*):void
         {
            _sounds.item[2].type = param1;
         },"_sounds.item[2].type");
         result[36] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT;
         },function(param1:*):void
         {
            _sounds.item[2].subber = param1;
         },"_sounds.item[2].subber");
         result[37] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Sound - voice");
         },function(param1:*):void
         {
            _sounds.item[3].label = param1;
         },"_sounds.item[3].label");
         result[38] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_SOUND;
         },function(param1:*):void
         {
            _sounds.item[3].type = param1;
         },"_sounds.item[3].type");
         result[39] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER;
         },function(param1:*):void
         {
            _sounds.item[3].subber = param1;
         },"_sounds.item[3].subber");
         result[40] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Please select a type:");
         },function(param1:*):void
         {
            _flashs.item[0].label = param1;
         },"_flashs.item[0].label");
         result[41] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Other Prop");
         },function(param1:*):void
         {
            _flashs.item[1].label = param1;
         },"_flashs.item[1].label");
         result[42] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_PROP_PLACEABLE;
         },function(param1:*):void
         {
            _flashs.item[1].type = param1;
         },"_flashs.item[1].type");
         result[43] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Background");
         },function(param1:*):void
         {
            _flashs.item[2].label = param1;
         },"_flashs.item[2].label");
         result[44] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_BG;
         },function(param1:*):void
         {
            _flashs.item[2].type = param1;
         },"_flashs.item[2].type");
         result[45] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Character Action");
         },function(param1:*):void
         {
            _flashs.item[3].label = param1;
         },"_flashs.item[3].label");
         result[46] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_CHAR;
         },function(param1:*):void
         {
            _flashs.item[3].type = param1;
         },"_flashs.item[3].type");
         result[47] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Effect");
         },function(param1:*):void
         {
            _flashs.item[4].label = param1;
         },"_flashs.item[4].label");
         result[48] = new Binding(this,function():*
         {
            return AnimeConstants.ASSET_TYPE_FX;
         },function(param1:*):void
         {
            _flashs.item[4].type = param1;
         },"_flashs.item[4].type");
         result[49] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Please select a type:");
         },function(param1:*):void
         {
            _movies.item[0].label = param1;
         },"_movies.item[0].label");
         result[50] = new Binding(this,function():*
         {
            return UtilDict.toDisplay("importer","Video Prop");
         },function(param1:*):void
         {
            _movies.item[1].label = param1;
         },"_movies.item[1].label");
         result[51] = new Binding(this,function():Array
         {
            var _loc1_:* = _movies.item;
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_cboxMovie.source");
         result[52] = new Binding(this,function():Array
         {
            var _loc1_:* = _flashs.item;
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_cboxFlash.source");
         result[53] = new Binding(this,function():Array
         {
            var _loc1_:* = _sounds.item;
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_cboxSounds.source");
         result[54] = new Binding(this,function():Array
         {
            var _loc1_:* = _images.item;
            return _loc1_ == null || _loc1_ is Array || _loc1_ is Proxy ? _loc1_ : [_loc1_];
         },null,"_cboxImages.source");
         return result;
      }
      
      mx_internal function _importer_StylesInit() : void
      {
         var _loc1_:CSSStyleDeclaration = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:CSSCondition = null;
         var _loc5_:CSSSelector = null;
         if(mx_internal::_importer_StylesInit_done)
         {
            return;
         }
         mx_internal::_importer_StylesInit_done = true;
         styleManager.initProtoChainRoots();
      }
      
      [Bindable(event="propertyChange")]
      public function get _background() : Image
      {
         return this._243881267_background;
      }
      
      public function set _background(param1:Image) : void
      {
         var _loc2_:Object = this._243881267_background;
         if(_loc2_ !== param1)
         {
            this._243881267_background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnChar() : Button
      {
         return this._1731027309_btnChar;
      }
      
      public function set _btnChar(param1:Button) : void
      {
         var _loc2_:Object = this._1731027309_btnChar;
         if(_loc2_ !== param1)
         {
            this._1731027309_btnChar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnChar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnClose() : IconTextButton
      {
         return this._2122106277_btnClose;
      }
      
      public function set _btnClose(param1:IconTextButton) : void
      {
         var _loc2_:Object = this._2122106277_btnClose;
         if(_loc2_ !== param1)
         {
            this._2122106277_btnClose = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnClose",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnPopSubmit() : Button
      {
         return this._53440340_btnPopSubmit;
      }
      
      public function set _btnPopSubmit(param1:Button) : void
      {
         var _loc2_:Object = this._53440340_btnPopSubmit;
         if(_loc2_ !== param1)
         {
            this._53440340_btnPopSubmit = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnPopSubmit",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _cbType() : ComboBox
      {
         return this._1340917080_cbType;
      }
      
      public function set _cbType(param1:ComboBox) : void
      {
         var _loc2_:Object = this._1340917080_cbType;
         if(_loc2_ !== param1)
         {
            this._1340917080_cbType = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_cbType",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _cboxChars() : ComboBox
      {
         return this._2107295562_cboxChars;
      }
      
      public function set _cboxChars(param1:ComboBox) : void
      {
         var _loc2_:Object = this._2107295562_cboxChars;
         if(_loc2_ !== param1)
         {
            this._2107295562_cboxChars = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_cboxChars",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _cboxFlash() : ArrayCollection
      {
         return this._2104405815_cboxFlash;
      }
      
      public function set _cboxFlash(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._2104405815_cboxFlash;
         if(_loc2_ !== param1)
         {
            this._2104405815_cboxFlash = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_cboxFlash",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _cboxImages() : ArrayCollection
      {
         return this._725271361_cboxImages;
      }
      
      public function set _cboxImages(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._725271361_cboxImages;
         if(_loc2_ !== param1)
         {
            this._725271361_cboxImages = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_cboxImages",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _cboxMovie() : ArrayCollection
      {
         return this._2097831927_cboxMovie;
      }
      
      public function set _cboxMovie(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._2097831927_cboxMovie;
         if(_loc2_ !== param1)
         {
            this._2097831927_cboxMovie = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_cboxMovie",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _cboxSounds() : ArrayCollection
      {
         return this._436530293_cboxSounds;
      }
      
      public function set _cboxSounds(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._436530293_cboxSounds;
         if(_loc2_ !== param1)
         {
            this._436530293_cboxSounds = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_cboxSounds",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _charArray() : ArrayCollection
      {
         return this._46173988_charArray;
      }
      
      public function set _charArray(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._46173988_charArray;
         if(_loc2_ !== param1)
         {
            this._46173988_charArray = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_charArray",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ckPublic() : CheckBox
      {
         return this._589894064_ckPublic;
      }
      
      public function set _ckPublic(param1:CheckBox) : void
      {
         var _loc2_:Object = this._589894064_ckPublic;
         if(_loc2_ !== param1)
         {
            this._589894064_ckPublic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ckPublic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _flashUI() : FlashWindow
      {
         return this._1579377989_flashUI;
      }
      
      public function set _flashUI(param1:FlashWindow) : void
      {
         var _loc2_:Object = this._1579377989_flashUI;
         if(_loc2_ !== param1)
         {
            this._1579377989_flashUI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_flashUI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _flashs() : ObjectProxy
      {
         return this._1436421026_flashs;
      }
      
      public function set _flashs(param1:ObjectProxy) : void
      {
         var _loc2_:Object = this._1436421026_flashs;
         if(_loc2_ !== param1)
         {
            this._1436421026_flashs = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_flashs",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _homeUI() : Canvas
      {
         return this._1496793298_homeUI;
      }
      
      public function set _homeUI(param1:Canvas) : void
      {
         var _loc2_:Object = this._1496793298_homeUI;
         if(_loc2_ !== param1)
         {
            this._1496793298_homeUI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_homeUI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _imageUI() : ImageWindow
      {
         return this._24809488_imageUI;
      }
      
      public function set _imageUI(param1:ImageWindow) : void
      {
         var _loc2_:Object = this._24809488_imageUI;
         if(_loc2_ !== param1)
         {
            this._24809488_imageUI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_imageUI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _images() : ObjectProxy
      {
         return this._1523220375_images;
      }
      
      public function set _images(param1:ObjectProxy) : void
      {
         var _loc2_:Object = this._1523220375_images;
         if(_loc2_ !== param1)
         {
            this._1523220375_images = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_images",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _labelTag() : Label
      {
         return this._1868749467_labelTag;
      }
      
      public function set _labelTag(param1:Label) : void
      {
         var _loc2_:Object = this._1868749467_labelTag;
         if(_loc2_ !== param1)
         {
            this._1868749467_labelTag = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_labelTag",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _labelTag2() : Label
      {
         return this._2096658579_labelTag2;
      }
      
      public function set _labelTag2(param1:Label) : void
      {
         var _loc2_:Object = this._2096658579_labelTag2;
         if(_loc2_ !== param1)
         {
            this._2096658579_labelTag2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_labelTag2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _labelTitle() : Label
      {
         return this._571653789_labelTitle;
      }
      
      public function set _labelTitle(param1:Label) : void
      {
         var _loc2_:Object = this._571653789_labelTitle;
         if(_loc2_ !== param1)
         {
            this._571653789_labelTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_labelTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _logo1() : Image
      {
         return this._1472048409_logo1;
      }
      
      public function set _logo1(param1:Image) : void
      {
         var _loc2_:Object = this._1472048409_logo1;
         if(_loc2_ !== param1)
         {
            this._1472048409_logo1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_logo1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _logo2() : Image
      {
         return this._1472048408_logo2;
      }
      
      public function set _logo2(param1:Image) : void
      {
         var _loc2_:Object = this._1472048408_logo2;
         if(_loc2_ !== param1)
         {
            this._1472048408_logo2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_logo2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _logo3() : Image
      {
         return this._1472048407_logo3;
      }
      
      public function set _logo3(param1:Image) : void
      {
         var _loc2_:Object = this._1472048407_logo3;
         if(_loc2_ !== param1)
         {
            this._1472048407_logo3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_logo3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _logo4() : Image
      {
         return this._1472048406_logo4;
      }
      
      public function set _logo4(param1:Image) : void
      {
         var _loc2_:Object = this._1472048406_logo4;
         if(_loc2_ !== param1)
         {
            this._1472048406_logo4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_logo4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _logo4_beta() : Image
      {
         return this._1290289627_logo4_beta;
      }
      
      public function set _logo4_beta(param1:Image) : void
      {
         var _loc2_:Object = this._1290289627_logo4_beta;
         if(_loc2_ !== param1)
         {
            this._1290289627_logo4_beta = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_logo4_beta",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _mainWindow() : Canvas
      {
         return this._1657484456_mainWindow;
      }
      
      public function set _mainWindow(param1:Canvas) : void
      {
         var _loc2_:Object = this._1657484456_mainWindow;
         if(_loc2_ !== param1)
         {
            this._1657484456_mainWindow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_mainWindow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _movies() : ObjectProxy
      {
         return this._1640211554_movies;
      }
      
      public function set _movies(param1:ObjectProxy) : void
      {
         var _loc2_:Object = this._1640211554_movies;
         if(_loc2_ !== param1)
         {
            this._1640211554_movies = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_movies",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _pleaseEnterTitle() : Label
      {
         return this._2080614473_pleaseEnterTitle;
      }
      
      public function set _pleaseEnterTitle(param1:Label) : void
      {
         var _loc2_:Object = this._2080614473_pleaseEnterTitle;
         if(_loc2_ !== param1)
         {
            this._2080614473_pleaseEnterTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_pleaseEnterTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _popAlert() : Canvas
      {
         return this._715252458_popAlert;
      }
      
      public function set _popAlert(param1:Canvas) : void
      {
         var _loc2_:Object = this._715252458_popAlert;
         if(_loc2_ !== param1)
         {
            this._715252458_popAlert = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_popAlert",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _popClose() : IconTextButton
      {
         return this._717109126_popClose;
      }
      
      public function set _popClose(param1:IconTextButton) : void
      {
         var _loc2_:Object = this._717109126_popClose;
         if(_loc2_ !== param1)
         {
            this._717109126_popClose = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_popClose",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _popUpAlert() : Label
      {
         return this._814129551_popUpAlert;
      }
      
      public function set _popUpAlert(param1:Label) : void
      {
         var _loc2_:Object = this._814129551_popUpAlert;
         if(_loc2_ !== param1)
         {
            this._814129551_popUpAlert = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_popUpAlert",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _popWindow() : Canvas
      {
         return this._1325315106_popWindow;
      }
      
      public function set _popWindow(param1:Canvas) : void
      {
         var _loc2_:Object = this._1325315106_popWindow;
         if(_loc2_ !== param1)
         {
            this._1325315106_popWindow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_popWindow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _popWindowCover() : Canvas
      {
         return this._973409099_popWindowCover;
      }
      
      public function set _popWindowCover(param1:Canvas) : void
      {
         var _loc2_:Object = this._973409099_popWindowCover;
         if(_loc2_ !== param1)
         {
            this._973409099_popWindowCover = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_popWindowCover",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _soundUI() : SoundsWindow
      {
         return this._336229028_soundUI;
      }
      
      public function set _soundUI(param1:SoundsWindow) : void
      {
         var _loc2_:Object = this._336229028_soundUI;
         if(_loc2_ !== param1)
         {
            this._336229028_soundUI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_soundUI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _sounds() : ObjectProxy
      {
         return this._1811961443_sounds;
      }
      
      public function set _sounds(param1:ObjectProxy) : void
      {
         var _loc2_:Object = this._1811961443_sounds;
         if(_loc2_ !== param1)
         {
            this._1811961443_sounds = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_sounds",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtAlert() : Text
      {
         return this._1391325653_txtAlert;
      }
      
      public function set _txtAlert(param1:Text) : void
      {
         var _loc2_:Object = this._1391325653_txtAlert;
         if(_loc2_ !== param1)
         {
            this._1391325653_txtAlert = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtAlert",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtChar() : TextInput
      {
         return this._1479194791_txtChar;
      }
      
      public function set _txtChar(param1:TextInput) : void
      {
         var _loc2_:Object = this._1479194791_txtChar;
         if(_loc2_ !== param1)
         {
            this._1479194791_txtChar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtChar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtTags() : TextInput
      {
         return this._1479694698_txtTags;
      }
      
      public function set _txtTags(param1:TextInput) : void
      {
         var _loc2_:Object = this._1479694698_txtTags;
         if(_loc2_ !== param1)
         {
            this._1479694698_txtTags = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtTags",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtTitle() : TextInput
      {
         return this._1373853913_txtTitle;
      }
      
      public function set _txtTitle(param1:TextInput) : void
      {
         var _loc2_:Object = this._1373853913_txtTitle;
         if(_loc2_ !== param1)
         {
            this._1373853913_txtTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtTitle",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _videoUI() : FlashWindow
      {
         return this._1483959536_videoUI;
      }
      
      public function set _videoUI(param1:FlashWindow) : void
      {
         var _loc2_:Object = this._1483959536_videoUI;
         if(_loc2_ !== param1)
         {
            this._1483959536_videoUI = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_videoUI",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vsHome() : ViewStack
      {
         return this._1900203611_vsHome;
      }
      
      public function set _vsHome(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1900203611_vsHome;
         if(_loc2_ !== param1)
         {
            this._1900203611_vsHome = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vsHome",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _hasConsole() : Boolean
      {
         return this._222757124_hasConsole;
      }
      
      private function set _hasConsole(param1:Boolean) : void
      {
         var _loc2_:Object = this._222757124_hasConsole;
         if(_loc2_ !== param1)
         {
            this._222757124_hasConsole = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasConsole",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _bg() : Number
      {
         return this._94436_bg;
      }
      
      private function set _bg(param1:Number) : void
      {
         var _loc2_:Object = this._94436_bg;
         if(_loc2_ !== param1)
         {
            this._94436_bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get application() : Object
      {
         return this._1554253136application;
      }
      
      private function set application(param1:Object) : void
      {
         var _loc2_:Object = this._1554253136application;
         if(_loc2_ !== param1)
         {
            this._1554253136application = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"application",_loc2_,param1));
            }
         }
      }
   }
}
