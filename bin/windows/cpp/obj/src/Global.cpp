#include <hxcpp.h>

#ifndef INCLUDED_Block
#include <Block.h>
#endif
#ifndef INCLUDED_Global
#include <Global.h>
#endif
#ifndef INCLUDED_Level1
#include <Level1.h>
#endif
#ifndef INCLUDED_openfl__v2_display_DisplayObject
#include <openfl/_v2/display/DisplayObject.h>
#endif
#ifndef INCLUDED_openfl__v2_display_DisplayObjectContainer
#include <openfl/_v2/display/DisplayObjectContainer.h>
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

Void Global_obj::__construct()
{
	return null();
}

//Global_obj::~Global_obj() { }

Dynamic Global_obj::__CreateEmpty() { return  new Global_obj; }
hx::ObjectPtr< Global_obj > Global_obj::__new()
{  hx::ObjectPtr< Global_obj > result = new Global_obj();
	result->__construct();
	return result;}

Dynamic Global_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Global_obj > result = new Global_obj();
	result->__construct();
	return result;}

bool Global_obj::left;

bool Global_obj::right;

bool Global_obj::up;

bool Global_obj::down;

int Global_obj::levelWidth;

int Global_obj::levelHeight;

::Level1 Global_obj::level;

Array< ::Dynamic > Global_obj::blocks;


Global_obj::Global_obj()
{
}

Dynamic Global_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"up") ) { return up; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"left") ) { return left; }
		if (HX_FIELD_EQ(inName,"down") ) { return down; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"right") ) { return right; }
		if (HX_FIELD_EQ(inName,"level") ) { return level; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"blocks") ) { return blocks; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"levelWidth") ) { return levelWidth; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"levelHeight") ) { return levelHeight; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Global_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 2:
		if (HX_FIELD_EQ(inName,"up") ) { up=inValue.Cast< bool >(); return inValue; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"left") ) { left=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"down") ) { down=inValue.Cast< bool >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"right") ) { right=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"level") ) { level=inValue.Cast< ::Level1 >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"blocks") ) { blocks=inValue.Cast< Array< ::Dynamic > >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"levelWidth") ) { levelWidth=inValue.Cast< int >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"levelHeight") ) { levelHeight=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Global_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("left"),
	HX_CSTRING("right"),
	HX_CSTRING("up"),
	HX_CSTRING("down"),
	HX_CSTRING("levelWidth"),
	HX_CSTRING("levelHeight"),
	HX_CSTRING("level"),
	HX_CSTRING("blocks"),
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo *sMemberStorageInfo = 0;
#endif

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Global_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Global_obj::left,"left");
	HX_MARK_MEMBER_NAME(Global_obj::right,"right");
	HX_MARK_MEMBER_NAME(Global_obj::up,"up");
	HX_MARK_MEMBER_NAME(Global_obj::down,"down");
	HX_MARK_MEMBER_NAME(Global_obj::levelWidth,"levelWidth");
	HX_MARK_MEMBER_NAME(Global_obj::levelHeight,"levelHeight");
	HX_MARK_MEMBER_NAME(Global_obj::level,"level");
	HX_MARK_MEMBER_NAME(Global_obj::blocks,"blocks");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Global_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Global_obj::left,"left");
	HX_VISIT_MEMBER_NAME(Global_obj::right,"right");
	HX_VISIT_MEMBER_NAME(Global_obj::up,"up");
	HX_VISIT_MEMBER_NAME(Global_obj::down,"down");
	HX_VISIT_MEMBER_NAME(Global_obj::levelWidth,"levelWidth");
	HX_VISIT_MEMBER_NAME(Global_obj::levelHeight,"levelHeight");
	HX_VISIT_MEMBER_NAME(Global_obj::level,"level");
	HX_VISIT_MEMBER_NAME(Global_obj::blocks,"blocks");
};

#endif

Class Global_obj::__mClass;

void Global_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Global"), hx::TCanCast< Global_obj> ,sStaticFields,sMemberFields,
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

void Global_obj::__boot()
{
	blocks= Array_obj< ::Dynamic >::__new();
}

