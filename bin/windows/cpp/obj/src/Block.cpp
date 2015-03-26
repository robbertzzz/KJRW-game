#include <hxcpp.h>

#ifndef INCLUDED_Block
#include <Block.h>
#endif
#ifndef INCLUDED_openfl__v2_display_DisplayObject
#include <openfl/_v2/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl__v2_display_DisplayObjectContainer
#include <openfl/_v2/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_openfl__v2_display_Graphics
#include <openfl/_v2/display/Graphics.h>
#endif
#ifndef INCLUDED_openfl__v2_display_IBitmapDrawable
#include <openfl/_v2/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_openfl__v2_display_InteractiveObject
#include <openfl/_v2/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_openfl__v2_display_Sprite
#include <openfl/_v2/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl__v2_events_EventDispatcher
#include <openfl/_v2/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl__v2_events_IEventDispatcher
#include <openfl/_v2/events/IEventDispatcher.h>
#endif

Void Block_obj::__construct()
{
HX_STACK_FRAME("Block","new",0xdb44209f,"Block.new","Block.hx",13,0xf33517b1)
HX_STACK_THIS(this)
{
	HX_STACK_LINE(14)
	super::__construct();
	HX_STACK_LINE(16)
	this->get_graphics()->beginFill((int)16711680,null());
	HX_STACK_LINE(17)
	this->get_graphics()->drawRect((int)0,(int)0,(int)16,(int)16);
}
;
	return null();
}

//Block_obj::~Block_obj() { }

Dynamic Block_obj::__CreateEmpty() { return  new Block_obj; }
hx::ObjectPtr< Block_obj > Block_obj::__new()
{  hx::ObjectPtr< Block_obj > result = new Block_obj();
	result->__construct();
	return result;}

Dynamic Block_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Block_obj > result = new Block_obj();
	result->__construct();
	return result;}


Block_obj::Block_obj()
{
}

Dynamic Block_obj::__Field(const ::String &inName,bool inCallProp)
{
	return super::__Field(inName,inCallProp);
}

Dynamic Block_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	return super::__SetField(inName,inValue,inCallProp);
}

void Block_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *sMemberStorageInfo = 0;
#endif

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Block_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Block_obj::__mClass,"__mClass");
};

#endif

Class Block_obj::__mClass;

void Block_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Block"), hx::TCanCast< Block_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics
#ifdef HXCPP_VISIT_ALLOCS
    , sVisitStatics
#endif
#ifdef HXCPP_SCRIPTABLE
    , sMemberStorageInfo
#endif
);
}

void Block_obj::__boot()
{
}

