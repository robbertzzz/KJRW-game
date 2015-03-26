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
#ifndef INCLUDED_Player
#include <Player.h>
#endif
#ifndef INCLUDED_openfl__v2_Lib
#include <openfl/_v2/Lib.h>
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
#ifndef INCLUDED_openfl__v2_display_MovieClip
#include <openfl/_v2/display/MovieClip.h>
#endif
#ifndef INCLUDED_openfl__v2_display_Sprite
#include <openfl/_v2/display/Sprite.h>
#endif
#ifndef INCLUDED_openfl__v2_display_Stage
#include <openfl/_v2/display/Stage.h>
#endif
#ifndef INCLUDED_openfl__v2_events_EventDispatcher
#include <openfl/_v2/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl__v2_events_IEventDispatcher
#include <openfl/_v2/events/IEventDispatcher.h>
#endif

Void Level1_obj::__construct()
{
HX_STACK_FRAME("Level1","new",0x987b7dbf,"Level1.new","Level1.hx",10,0x0d4fbe91)
HX_STACK_THIS(this)
{
	HX_STACK_LINE(13)
	this->blocks = Array_obj< ::Dynamic >::__new();
	HX_STACK_LINE(18)
	super::__construct();
	HX_STACK_LINE(20)
	::Global_obj::level = hx::ObjectPtr<OBJ_>(this);
	HX_STACK_LINE(22)
	this->init();
}
;
	return null();
}

//Level1_obj::~Level1_obj() { }

Dynamic Level1_obj::__CreateEmpty() { return  new Level1_obj; }
hx::ObjectPtr< Level1_obj > Level1_obj::__new()
{  hx::ObjectPtr< Level1_obj > result = new Level1_obj();
	result->__construct();
	return result;}

Dynamic Level1_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Level1_obj > result = new Level1_obj();
	result->__construct();
	return result;}

Void Level1_obj::move( Float x,Float y){
{
		HX_STACK_FRAME("Level1","move",0xd2f0e8d2,"Level1.move","Level1.hx",25,0x0d4fbe91)
		HX_STACK_THIS(this)
		HX_STACK_ARG(x,"x")
		HX_STACK_ARG(y,"y")
		HX_STACK_LINE(26)
		this->set_x(x);
		HX_STACK_LINE(27)
		this->set_y(y);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(Level1_obj,move,(void))

Void Level1_obj::init( ){
{
		HX_STACK_FRAME("Level1","init",0xd04b40d1,"Level1.init","Level1.hx",31,0x0d4fbe91)
		HX_STACK_THIS(this)
		HX_STACK_LINE(32)
		::Player _g = ::Player_obj::__new();		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(32)
		this->player = _g;
		HX_STACK_LINE(33)
		this->player->set_x((int)16);
		HX_STACK_LINE(34)
		int _g1 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageHeight();		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(34)
		int _g2 = (_g1 - (int)32);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(34)
		this->player->set_y(_g2);
		HX_STACK_LINE(35)
		this->addChild(this->player);
		HX_STACK_LINE(37)
		::Global_obj::levelWidth = (int)1280;
		HX_STACK_LINE(38)
		::Global_obj::levelHeight = (int)960;
		HX_STACK_LINE(40)
		{
			HX_STACK_LINE(40)
			int _g3 = (int)0;		HX_STACK_VAR(_g3,"_g3");
			HX_STACK_LINE(40)
			while((true)){
				HX_STACK_LINE(40)
				if ((!(((_g3 < (int)80))))){
					HX_STACK_LINE(40)
					break;
				}
				HX_STACK_LINE(40)
				int i = (_g3)++;		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(41)
				this->blocks[(i * (int)2)] = ::Block_obj::__new();
				HX_STACK_LINE(42)
				this->blocks->__get((i * (int)2)).StaticCast< ::Block >()->set_x(((int)16 * i));
				HX_STACK_LINE(43)
				int _g31 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageHeight();		HX_STACK_VAR(_g31,"_g31");
				HX_STACK_LINE(43)
				int _g4 = (_g31 * (int)2);		HX_STACK_VAR(_g4,"_g4");
				HX_STACK_LINE(43)
				int _g5 = (_g4 - (int)16);		HX_STACK_VAR(_g5,"_g5");
				HX_STACK_LINE(43)
				this->blocks->__get((i * (int)2)).StaticCast< ::Block >()->set_y(_g5);
				HX_STACK_LINE(44)
				this->addChild(this->blocks->__get((i * (int)2)).StaticCast< ::Block >());
				HX_STACK_LINE(45)
				this->blocks[((i * (int)2) + (int)1)] = ::Block_obj::__new();
				HX_STACK_LINE(46)
				this->blocks->__get(((i * (int)2) + (int)1)).StaticCast< ::Block >()->set_x(((int)16 * i));
				HX_STACK_LINE(47)
				this->blocks->__get(((i * (int)2) + (int)1)).StaticCast< ::Block >()->set_y((int)0);
				HX_STACK_LINE(48)
				this->addChild(this->blocks->__get(((i * (int)2) + (int)1)).StaticCast< ::Block >());
			}
		}
		HX_STACK_LINE(51)
		{
			HX_STACK_LINE(51)
			int _g3 = (int)0;		HX_STACK_VAR(_g3,"_g3");
			HX_STACK_LINE(51)
			while((true)){
				HX_STACK_LINE(51)
				if ((!(((_g3 < (int)58))))){
					HX_STACK_LINE(51)
					break;
				}
				HX_STACK_LINE(51)
				int i = (_g3)++;		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(52)
				this->index = this->blocks->length;
				HX_STACK_LINE(53)
				this->blocks[this->index] = ::Block_obj::__new();
				HX_STACK_LINE(54)
				this->blocks->__get(this->index).StaticCast< ::Block >()->set_x((int)0);
				HX_STACK_LINE(55)
				this->blocks->__get(this->index).StaticCast< ::Block >()->set_y((((i + (int)1)) * (int)16));
				HX_STACK_LINE(56)
				this->addChild(this->blocks->__get(this->index).StaticCast< ::Block >());
				HX_STACK_LINE(57)
				this->index = this->blocks->length;
				HX_STACK_LINE(58)
				this->blocks[this->index] = ::Block_obj::__new();
				HX_STACK_LINE(59)
				int _g6 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageWidth();		HX_STACK_VAR(_g6,"_g6");
				HX_STACK_LINE(59)
				int _g7 = (_g6 * (int)2);		HX_STACK_VAR(_g7,"_g7");
				HX_STACK_LINE(59)
				int _g8 = (_g7 - (int)16);		HX_STACK_VAR(_g8,"_g8");
				HX_STACK_LINE(59)
				this->blocks->__get(this->index).StaticCast< ::Block >()->set_x(_g8);
				HX_STACK_LINE(60)
				this->blocks->__get(this->index).StaticCast< ::Block >()->set_y((((i + (int)1)) * (int)16));
				HX_STACK_LINE(61)
				this->addChild(this->blocks->__get(this->index).StaticCast< ::Block >());
			}
		}
		HX_STACK_LINE(65)
		{
			HX_STACK_LINE(65)
			int _g3 = (int)0;		HX_STACK_VAR(_g3,"_g3");
			HX_STACK_LINE(65)
			while((true)){
				HX_STACK_LINE(65)
				if ((!(((_g3 < (int)58))))){
					HX_STACK_LINE(65)
					break;
				}
				HX_STACK_LINE(65)
				int i = (_g3)++;		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(66)
				this->index = this->blocks->length;
				HX_STACK_LINE(67)
				this->blocks[this->index] = ::Block_obj::__new();
				HX_STACK_LINE(68)
				this->blocks->__get(this->index).StaticCast< ::Block >()->set_x(((int)64 + ((int)16 * i)));
				HX_STACK_LINE(69)
				int _g9 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageHeight();		HX_STACK_VAR(_g9,"_g9");
				HX_STACK_LINE(69)
				int _g10 = (_g9 * (int)2);		HX_STACK_VAR(_g10,"_g10");
				HX_STACK_LINE(69)
				int _g11 = (_g10 - ((int)16 * i));		HX_STACK_VAR(_g11,"_g11");
				HX_STACK_LINE(69)
				int _g12 = (_g11 - (int)32);		HX_STACK_VAR(_g12,"_g12");
				HX_STACK_LINE(69)
				this->blocks->__get(this->index).StaticCast< ::Block >()->set_y(_g12);
				HX_STACK_LINE(70)
				this->addChild(this->blocks->__get(this->index).StaticCast< ::Block >());
			}
		}
		HX_STACK_LINE(73)
		::Global_obj::blocks = this->blocks;
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Level1_obj,init,(void))


Level1_obj::Level1_obj()
{
}

void Level1_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Level1);
	HX_MARK_MEMBER_NAME(player,"player");
	HX_MARK_MEMBER_NAME(blocks,"blocks");
	HX_MARK_MEMBER_NAME(i,"i");
	HX_MARK_MEMBER_NAME(index,"index");
	::openfl::_v2::display::DisplayObjectContainer_obj::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Level1_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(player,"player");
	HX_VISIT_MEMBER_NAME(blocks,"blocks");
	HX_VISIT_MEMBER_NAME(i,"i");
	HX_VISIT_MEMBER_NAME(index,"index");
	::openfl::_v2::display::DisplayObjectContainer_obj::__Visit(HX_VISIT_ARG);
}

Dynamic Level1_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"i") ) { return i; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"move") ) { return move_dyn(); }
		if (HX_FIELD_EQ(inName,"init") ) { return init_dyn(); }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"index") ) { return index; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"player") ) { return player; }
		if (HX_FIELD_EQ(inName,"blocks") ) { return blocks; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Level1_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"i") ) { i=inValue.Cast< int >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"index") ) { index=inValue.Cast< int >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"player") ) { player=inValue.Cast< ::Player >(); return inValue; }
		if (HX_FIELD_EQ(inName,"blocks") ) { blocks=inValue.Cast< Array< ::Dynamic > >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Level1_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("player"));
	outFields->push(HX_CSTRING("blocks"));
	outFields->push(HX_CSTRING("i"));
	outFields->push(HX_CSTRING("index"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo sMemberStorageInfo[] = {
	{hx::fsObject /*::Player*/ ,(int)offsetof(Level1_obj,player),HX_CSTRING("player")},
	{hx::fsObject /*Array< ::Dynamic >*/ ,(int)offsetof(Level1_obj,blocks),HX_CSTRING("blocks")},
	{hx::fsInt,(int)offsetof(Level1_obj,i),HX_CSTRING("i")},
	{hx::fsInt,(int)offsetof(Level1_obj,index),HX_CSTRING("index")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String sMemberFields[] = {
	HX_CSTRING("player"),
	HX_CSTRING("blocks"),
	HX_CSTRING("i"),
	HX_CSTRING("move"),
	HX_CSTRING("index"),
	HX_CSTRING("init"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Level1_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Level1_obj::__mClass,"__mClass");
};

#endif

Class Level1_obj::__mClass;

void Level1_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Level1"), hx::TCanCast< Level1_obj> ,sStaticFields,sMemberFields,
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

void Level1_obj::__boot()
{
}

