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
#ifndef INCLUDED_haxe_Log
#include <haxe/Log.h>
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
#ifndef INCLUDED_openfl__v2_display_Graphics
#include <openfl/_v2/display/Graphics.h>
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
#ifndef INCLUDED_openfl__v2_events_Event
#include <openfl/_v2/events/Event.h>
#endif
#ifndef INCLUDED_openfl__v2_events_EventDispatcher
#include <openfl/_v2/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_openfl__v2_events_IEventDispatcher
#include <openfl/_v2/events/IEventDispatcher.h>
#endif

Void Player_obj::__construct()
{
HX_STACK_FRAME("Player","new",0x8d5554f3,"Player.new","Player.hx",11,0xa27fc9dd)
HX_STACK_THIS(this)
{
	HX_STACK_LINE(19)
	this->isJumping = false;
	HX_STACK_LINE(18)
	this->gravity = 0.75;
	HX_STACK_LINE(16)
	this->maxYSpeed = (int)10;
	HX_STACK_LINE(15)
	this->maxXSpeed = (int)5;
	HX_STACK_LINE(14)
	this->ySpeed = (int)0;
	HX_STACK_LINE(13)
	this->xSpeed = (int)0;
	HX_STACK_LINE(23)
	super::__construct();
	HX_STACK_LINE(25)
	this->get_graphics()->beginFill((int)255,null());
	HX_STACK_LINE(26)
	this->get_graphics()->drawRect((int)0,(int)0,(int)20,(int)50);
	HX_STACK_LINE(28)
	this->addEventListener(::openfl::_v2::events::Event_obj::ENTER_FRAME,this->update_dyn(),null(),null(),null());
}
;
	return null();
}

//Player_obj::~Player_obj() { }

Dynamic Player_obj::__CreateEmpty() { return  new Player_obj; }
hx::ObjectPtr< Player_obj > Player_obj::__new()
{  hx::ObjectPtr< Player_obj > result = new Player_obj();
	result->__construct();
	return result;}

Dynamic Player_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Player_obj > result = new Player_obj();
	result->__construct();
	return result;}

Void Player_obj::update( ::openfl::_v2::events::Event e){
{
		HX_STACK_FRAME("Player","update",0xf1f8df56,"Player.update","Player.hx",31,0xa27fc9dd)
		HX_STACK_THIS(this)
		HX_STACK_ARG(e,"e")
		HX_STACK_LINE(32)
		this->move();
		HX_STACK_LINE(33)
		this->moveView();
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(Player_obj,update,(void))

Void Player_obj::moveView( ){
{
		HX_STACK_FRAME("Player","moveView",0x827ca4a3,"Player.moveView","Player.hx",38,0xa27fc9dd)
		HX_STACK_THIS(this)
		HX_STACK_LINE(39)
		Float _g = this->get_x();		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(39)
		Float _g1 = this->get_width();		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(39)
		Float _g2 = (_g1 * 0.5);		HX_STACK_VAR(_g2,"_g2");
		HX_STACK_LINE(39)
		Float _g3 = (_g - _g2);		HX_STACK_VAR(_g3,"_g3");
		HX_STACK_LINE(39)
		int _g4 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageWidth();		HX_STACK_VAR(_g4,"_g4");
		HX_STACK_LINE(39)
		Float _g5 = (_g4 * 0.5);		HX_STACK_VAR(_g5,"_g5");
		struct _Function_1_1{
			inline static bool Block( hx::ObjectPtr< ::Player_obj > __this){
				HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",39,0xa27fc9dd)
				{
					HX_STACK_LINE(39)
					Float _g6 = __this->get_x();		HX_STACK_VAR(_g6,"_g6");
					HX_STACK_LINE(39)
					Float _g7 = __this->get_width();		HX_STACK_VAR(_g7,"_g7");
					HX_STACK_LINE(39)
					Float _g8 = (_g7 * 0.5);		HX_STACK_VAR(_g8,"_g8");
					HX_STACK_LINE(39)
					Float _g9 = (_g6 - _g8);		HX_STACK_VAR(_g9,"_g9");
					HX_STACK_LINE(39)
					int _g10 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageWidth();		HX_STACK_VAR(_g10,"_g10");
					HX_STACK_LINE(39)
					Float _g11 = (_g10 * 0.5);		HX_STACK_VAR(_g11,"_g11");
					HX_STACK_LINE(39)
					Float _g12 = (::Global_obj::levelWidth - _g11);		HX_STACK_VAR(_g12,"_g12");
					HX_STACK_LINE(39)
					return (_g9 < _g12);
				}
				return null();
			}
		};
		HX_STACK_LINE(39)
		if (((  (((_g3 > _g5))) ? bool(_Function_1_1::Block(this)) : bool(false) ))){
			HX_STACK_LINE(40)
			int _g13 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageWidth();		HX_STACK_VAR(_g13,"_g13");
			HX_STACK_LINE(40)
			Float _g14 = (_g13 * 0.5);		HX_STACK_VAR(_g14,"_g14");
			HX_STACK_LINE(40)
			Float _g15 = this->get_x();		HX_STACK_VAR(_g15,"_g15");
			HX_STACK_LINE(40)
			Float _g16 = (_g14 - _g15);		HX_STACK_VAR(_g16,"_g16");
			HX_STACK_LINE(40)
			Float _g17 = this->get_width();		HX_STACK_VAR(_g17,"_g17");
			HX_STACK_LINE(40)
			Float _g18 = (_g17 * 0.5);		HX_STACK_VAR(_g18,"_g18");
			HX_STACK_LINE(40)
			Float _g19 = (_g16 + _g18);		HX_STACK_VAR(_g19,"_g19");
			HX_STACK_LINE(40)
			this->moveViewX = _g19;
		}
		else{
			HX_STACK_LINE(41)
			Float _g20 = this->get_x();		HX_STACK_VAR(_g20,"_g20");
			HX_STACK_LINE(41)
			Float _g21 = this->get_width();		HX_STACK_VAR(_g21,"_g21");
			HX_STACK_LINE(41)
			Float _g22 = (_g21 * 0.5);		HX_STACK_VAR(_g22,"_g22");
			HX_STACK_LINE(41)
			Float _g23 = (_g20 - _g22);		HX_STACK_VAR(_g23,"_g23");
			HX_STACK_LINE(41)
			int _g24 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageWidth();		HX_STACK_VAR(_g24,"_g24");
			HX_STACK_LINE(41)
			Float _g25 = (_g24 * 0.5);		HX_STACK_VAR(_g25,"_g25");
			HX_STACK_LINE(41)
			if (((_g23 > _g25))){
				HX_STACK_LINE(42)
				int _g26 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageWidth();		HX_STACK_VAR(_g26,"_g26");
				HX_STACK_LINE(42)
				int _g27 = (_g26 - ::Global_obj::levelWidth);		HX_STACK_VAR(_g27,"_g27");
				HX_STACK_LINE(42)
				this->moveViewX = _g27;
			}
			else{
				HX_STACK_LINE(43)
				Float _g28 = this->get_x();		HX_STACK_VAR(_g28,"_g28");
				HX_STACK_LINE(43)
				Float _g29 = this->get_width();		HX_STACK_VAR(_g29,"_g29");
				HX_STACK_LINE(43)
				Float _g30 = (_g29 * 0.5);		HX_STACK_VAR(_g30,"_g30");
				HX_STACK_LINE(43)
				Float _g31 = (_g28 - _g30);		HX_STACK_VAR(_g31,"_g31");
				HX_STACK_LINE(43)
				int _g32 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageWidth();		HX_STACK_VAR(_g32,"_g32");
				HX_STACK_LINE(43)
				Float _g33 = (_g32 * 0.5);		HX_STACK_VAR(_g33,"_g33");
				HX_STACK_LINE(43)
				Float _g34 = (::Global_obj::levelWidth - _g33);		HX_STACK_VAR(_g34,"_g34");
				HX_STACK_LINE(43)
				if (((_g31 < _g34))){
					HX_STACK_LINE(44)
					this->moveViewX = (int)0;
				}
			}
		}
		HX_STACK_LINE(47)
		Float _g35 = this->get_y();		HX_STACK_VAR(_g35,"_g35");
		HX_STACK_LINE(47)
		Float _g36 = this->get_height();		HX_STACK_VAR(_g36,"_g36");
		HX_STACK_LINE(47)
		Float _g37 = (_g36 * 0.5);		HX_STACK_VAR(_g37,"_g37");
		HX_STACK_LINE(47)
		Float _g38 = (_g35 - _g37);		HX_STACK_VAR(_g38,"_g38");
		HX_STACK_LINE(47)
		int _g39 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageHeight();		HX_STACK_VAR(_g39,"_g39");
		HX_STACK_LINE(47)
		Float _g40 = (_g39 * 0.5);		HX_STACK_VAR(_g40,"_g40");
		struct _Function_1_2{
			inline static bool Block( hx::ObjectPtr< ::Player_obj > __this){
				HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",47,0xa27fc9dd)
				{
					HX_STACK_LINE(47)
					Float _g41 = __this->get_y();		HX_STACK_VAR(_g41,"_g41");
					HX_STACK_LINE(47)
					Float _g42 = __this->get_height();		HX_STACK_VAR(_g42,"_g42");
					HX_STACK_LINE(47)
					Float _g43 = (_g42 * 0.5);		HX_STACK_VAR(_g43,"_g43");
					HX_STACK_LINE(47)
					Float _g44 = (_g41 - _g43);		HX_STACK_VAR(_g44,"_g44");
					HX_STACK_LINE(47)
					int _g45 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageHeight();		HX_STACK_VAR(_g45,"_g45");
					HX_STACK_LINE(47)
					Float _g46 = (_g45 * 0.5);		HX_STACK_VAR(_g46,"_g46");
					HX_STACK_LINE(47)
					Float _g47 = (::Global_obj::levelHeight - _g46);		HX_STACK_VAR(_g47,"_g47");
					HX_STACK_LINE(47)
					return (_g44 < _g47);
				}
				return null();
			}
		};
		HX_STACK_LINE(47)
		if (((  (((_g38 > _g40))) ? bool(_Function_1_2::Block(this)) : bool(false) ))){
			HX_STACK_LINE(48)
			int _g48 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageHeight();		HX_STACK_VAR(_g48,"_g48");
			HX_STACK_LINE(48)
			Float _g49 = (_g48 * 0.5);		HX_STACK_VAR(_g49,"_g49");
			HX_STACK_LINE(48)
			Float _g50 = this->get_y();		HX_STACK_VAR(_g50,"_g50");
			HX_STACK_LINE(48)
			Float _g51 = (_g49 - _g50);		HX_STACK_VAR(_g51,"_g51");
			HX_STACK_LINE(48)
			Float _g52 = this->get_height();		HX_STACK_VAR(_g52,"_g52");
			HX_STACK_LINE(48)
			Float _g53 = (_g52 * 0.5);		HX_STACK_VAR(_g53,"_g53");
			HX_STACK_LINE(48)
			Float _g54 = (_g51 + _g53);		HX_STACK_VAR(_g54,"_g54");
			HX_STACK_LINE(48)
			this->moveViewY = _g54;
		}
		else{
			HX_STACK_LINE(49)
			Float _g55 = this->get_y();		HX_STACK_VAR(_g55,"_g55");
			HX_STACK_LINE(49)
			Float _g56 = this->get_height();		HX_STACK_VAR(_g56,"_g56");
			HX_STACK_LINE(49)
			Float _g57 = (_g56 * 0.5);		HX_STACK_VAR(_g57,"_g57");
			HX_STACK_LINE(49)
			Float _g58 = (_g55 - _g57);		HX_STACK_VAR(_g58,"_g58");
			HX_STACK_LINE(49)
			int _g59 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageHeight();		HX_STACK_VAR(_g59,"_g59");
			HX_STACK_LINE(49)
			Float _g60 = (_g59 * 0.5);		HX_STACK_VAR(_g60,"_g60");
			HX_STACK_LINE(49)
			if (((_g58 > _g60))){
				HX_STACK_LINE(50)
				int _g61 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageHeight();		HX_STACK_VAR(_g61,"_g61");
				HX_STACK_LINE(50)
				int _g62 = (_g61 - ::Global_obj::levelHeight);		HX_STACK_VAR(_g62,"_g62");
				HX_STACK_LINE(50)
				this->moveViewY = _g62;
			}
			else{
				HX_STACK_LINE(51)
				Float _g63 = this->get_y();		HX_STACK_VAR(_g63,"_g63");
				HX_STACK_LINE(51)
				Float _g64 = this->get_height();		HX_STACK_VAR(_g64,"_g64");
				HX_STACK_LINE(51)
				Float _g65 = (_g64 * 0.5);		HX_STACK_VAR(_g65,"_g65");
				HX_STACK_LINE(51)
				Float _g66 = (_g63 - _g65);		HX_STACK_VAR(_g66,"_g66");
				HX_STACK_LINE(51)
				int _g67 = ::openfl::_v2::Lib_obj::get_current()->get_stage()->get_stageHeight();		HX_STACK_VAR(_g67,"_g67");
				HX_STACK_LINE(51)
				Float _g68 = (_g67 * 0.5);		HX_STACK_VAR(_g68,"_g68");
				HX_STACK_LINE(51)
				Float _g69 = (::Global_obj::levelHeight - _g68);		HX_STACK_VAR(_g69,"_g69");
				HX_STACK_LINE(51)
				if (((_g66 < _g69))){
					HX_STACK_LINE(52)
					this->moveViewY = (int)0;
				}
			}
		}
		HX_STACK_LINE(55)
		::Global_obj::level->move(this->moveViewX,this->moveViewY);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Player_obj,moveView,(void))

Void Player_obj::move( ){
{
		HX_STACK_FRAME("Player","move",0x1cb35f1e,"Player.move","Player.hx",66,0xa27fc9dd)
		HX_STACK_THIS(this)
		HX_STACK_LINE(67)
		this->xSpeed = (int)0;
		HX_STACK_LINE(68)
		if ((::Global_obj::left)){
			HX_STACK_LINE(70)
			this->againstWall = false;
			HX_STACK_LINE(71)
			{
				HX_STACK_LINE(71)
				int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
				HX_STACK_LINE(71)
				int _g = ::Global_obj::blocks->length;		HX_STACK_VAR(_g,"_g");
				HX_STACK_LINE(71)
				while((true)){
					HX_STACK_LINE(71)
					if ((!(((_g1 < _g))))){
						HX_STACK_LINE(71)
						break;
					}
					HX_STACK_LINE(71)
					int i = (_g1)++;		HX_STACK_VAR(i,"i");
					HX_STACK_LINE(72)
					Float _g2 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g2,"_g2");
					HX_STACK_LINE(72)
					Float _g11 = this->get_y();		HX_STACK_VAR(_g11,"_g11");
					HX_STACK_LINE(72)
					Float _g21 = this->get_height();		HX_STACK_VAR(_g21,"_g21");
					HX_STACK_LINE(72)
					Float _g3 = (_g11 + _g21);		HX_STACK_VAR(_g3,"_g3");
					struct _Function_4_1{
						inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
							HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",73,0xa27fc9dd)
							{
								HX_STACK_LINE(73)
								Float _g4 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g4,"_g4");
								HX_STACK_LINE(73)
								Float _g5 = __this->get_y();		HX_STACK_VAR(_g5,"_g5");
								HX_STACK_LINE(73)
								Float _g6 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_height();		HX_STACK_VAR(_g6,"_g6");
								HX_STACK_LINE(73)
								Float _g7 = (_g5 - _g6);		HX_STACK_VAR(_g7,"_g7");
								HX_STACK_LINE(73)
								return (_g4 > _g7);
							}
							return null();
						}
					};
					struct _Function_4_2{
						inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
							HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",74,0xa27fc9dd)
							{
								HX_STACK_LINE(74)
								Float _g8 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g8,"_g8");
								HX_STACK_LINE(74)
								Float _g9 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_width();		HX_STACK_VAR(_g9,"_g9");
								HX_STACK_LINE(74)
								Float _g10 = (_g8 + _g9);		HX_STACK_VAR(_g10,"_g10");
								HX_STACK_LINE(74)
								Float _g111 = __this->get_x();		HX_STACK_VAR(_g111,"_g111");
								HX_STACK_LINE(74)
								Float _g12 = (_g111 - __this->maxXSpeed);		HX_STACK_VAR(_g12,"_g12");
								HX_STACK_LINE(74)
								return (_g10 >= _g12);
							}
							return null();
						}
					};
					struct _Function_4_3{
						inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
							HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",75,0xa27fc9dd)
							{
								HX_STACK_LINE(75)
								Float _g13 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g13,"_g13");
								HX_STACK_LINE(75)
								Float _g14 = __this->get_x();		HX_STACK_VAR(_g14,"_g14");
								HX_STACK_LINE(75)
								Float _g15 = (_g14 - __this->maxXSpeed);		HX_STACK_VAR(_g15,"_g15");
								HX_STACK_LINE(75)
								return (_g13 < _g15);
							}
							return null();
						}
					};
					HX_STACK_LINE(72)
					if (((  (((  (((  (((_g2 < _g3))) ? bool(_Function_4_1::Block(i,this)) : bool(false) ))) ? bool(_Function_4_2::Block(i,this)) : bool(false) ))) ? bool(_Function_4_3::Block(i,this)) : bool(false) ))){
						HX_STACK_LINE(76)
						this->againstWall = true;
						HX_STACK_LINE(77)
						this->wallBlock = i;
						HX_STACK_LINE(78)
						break;
					}
				}
			}
			HX_STACK_LINE(83)
			if ((this->againstWall)){
				HX_STACK_LINE(85)
				this->xSpeed = (int)0;
				HX_STACK_LINE(86)
				Float _g16 = ::Global_obj::blocks->__get(this->wallBlock).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g16,"_g16");
				HX_STACK_LINE(86)
				Float _g17 = ::Global_obj::blocks->__get(this->wallBlock).StaticCast< ::Block >()->get_width();		HX_STACK_VAR(_g17,"_g17");
				HX_STACK_LINE(86)
				Float _g18 = (_g16 + _g17);		HX_STACK_VAR(_g18,"_g18");
				HX_STACK_LINE(86)
				this->set_x(_g18);
			}
			else{
				HX_STACK_LINE(88)
				hx::SubEq(this->xSpeed,this->maxXSpeed);
			}
		}
		HX_STACK_LINE(92)
		if ((::Global_obj::right)){
			HX_STACK_LINE(94)
			this->againstWall = false;
			HX_STACK_LINE(95)
			{
				HX_STACK_LINE(95)
				int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
				HX_STACK_LINE(95)
				int _g = ::Global_obj::blocks->length;		HX_STACK_VAR(_g,"_g");
				HX_STACK_LINE(95)
				while((true)){
					HX_STACK_LINE(95)
					if ((!(((_g1 < _g))))){
						HX_STACK_LINE(95)
						break;
					}
					HX_STACK_LINE(95)
					int i = (_g1)++;		HX_STACK_VAR(i,"i");
					HX_STACK_LINE(96)
					Float _g19 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g19,"_g19");
					HX_STACK_LINE(96)
					Float _g20 = this->get_y();		HX_STACK_VAR(_g20,"_g20");
					HX_STACK_LINE(96)
					Float _g21 = this->get_height();		HX_STACK_VAR(_g21,"_g21");
					HX_STACK_LINE(96)
					Float _g22 = (_g20 + _g21);		HX_STACK_VAR(_g22,"_g22");
					struct _Function_4_1{
						inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
							HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",97,0xa27fc9dd)
							{
								HX_STACK_LINE(97)
								Float _g23 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g23,"_g23");
								HX_STACK_LINE(97)
								Float _g24 = __this->get_y();		HX_STACK_VAR(_g24,"_g24");
								HX_STACK_LINE(97)
								Float _g25 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_height();		HX_STACK_VAR(_g25,"_g25");
								HX_STACK_LINE(97)
								Float _g26 = (_g24 - _g25);		HX_STACK_VAR(_g26,"_g26");
								HX_STACK_LINE(97)
								return (_g23 > _g26);
							}
							return null();
						}
					};
					struct _Function_4_2{
						inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
							HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",98,0xa27fc9dd)
							{
								HX_STACK_LINE(98)
								Float _g27 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g27,"_g27");
								HX_STACK_LINE(98)
								Float _g28 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_width();		HX_STACK_VAR(_g28,"_g28");
								HX_STACK_LINE(98)
								Float _g29 = (_g27 + _g28);		HX_STACK_VAR(_g29,"_g29");
								HX_STACK_LINE(98)
								Float _g30 = __this->get_x();		HX_STACK_VAR(_g30,"_g30");
								HX_STACK_LINE(98)
								Float _g31 = (_g30 + __this->maxXSpeed);		HX_STACK_VAR(_g31,"_g31");
								HX_STACK_LINE(98)
								return (_g29 > _g31);
							}
							return null();
						}
					};
					struct _Function_4_3{
						inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
							HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",99,0xa27fc9dd)
							{
								HX_STACK_LINE(99)
								Float _g32 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g32,"_g32");
								HX_STACK_LINE(99)
								Float _g33 = __this->get_x();		HX_STACK_VAR(_g33,"_g33");
								HX_STACK_LINE(99)
								Float _g34 = __this->get_width();		HX_STACK_VAR(_g34,"_g34");
								HX_STACK_LINE(99)
								Float _g35 = (_g33 + _g34);		HX_STACK_VAR(_g35,"_g35");
								HX_STACK_LINE(99)
								Float _g36 = (_g35 + __this->maxXSpeed);		HX_STACK_VAR(_g36,"_g36");
								HX_STACK_LINE(99)
								return (_g32 <= _g36);
							}
							return null();
						}
					};
					HX_STACK_LINE(96)
					if (((  (((  (((  (((_g19 < _g22))) ? bool(_Function_4_1::Block(i,this)) : bool(false) ))) ? bool(_Function_4_2::Block(i,this)) : bool(false) ))) ? bool(_Function_4_3::Block(i,this)) : bool(false) ))){
						HX_STACK_LINE(100)
						this->againstWall = true;
						HX_STACK_LINE(101)
						this->wallBlock = i;
						HX_STACK_LINE(102)
						break;
					}
				}
			}
			HX_STACK_LINE(107)
			if ((this->againstWall)){
				HX_STACK_LINE(109)
				this->xSpeed = (int)0;
				HX_STACK_LINE(110)
				Float _g37 = ::Global_obj::blocks->__get(this->wallBlock).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g37,"_g37");
				HX_STACK_LINE(110)
				Float _g38 = this->get_width();		HX_STACK_VAR(_g38,"_g38");
				HX_STACK_LINE(110)
				Float _g39 = (_g37 - _g38);		HX_STACK_VAR(_g39,"_g39");
				HX_STACK_LINE(110)
				this->set_x(_g39);
			}
			else{
				HX_STACK_LINE(112)
				hx::AddEq(this->xSpeed,this->maxXSpeed);
			}
		}
		HX_STACK_LINE(115)
		if ((::Global_obj::up)){
			HX_STACK_LINE(116)
			if ((!(this->isJumping))){
				HX_STACK_LINE(117)
				this->startJumping();
			}
		}
		HX_STACK_LINE(120)
		this->jumpController();
		HX_STACK_LINE(121)
		{
			HX_STACK_LINE(121)
			::Player _g = hx::ObjectPtr<OBJ_>(this);		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(121)
			Float _g40 = _g->get_x();		HX_STACK_VAR(_g40,"_g40");
			HX_STACK_LINE(121)
			Float _g41 = (_g40 + this->xSpeed);		HX_STACK_VAR(_g41,"_g41");
			HX_STACK_LINE(121)
			_g->set_x(_g41);
		}
		HX_STACK_LINE(122)
		{
			HX_STACK_LINE(122)
			::Player _g = hx::ObjectPtr<OBJ_>(this);		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(122)
			Float _g42 = _g->get_y();		HX_STACK_VAR(_g42,"_g42");
			HX_STACK_LINE(122)
			Float _g43 = (_g42 + this->ySpeed);		HX_STACK_VAR(_g43,"_g43");
			HX_STACK_LINE(122)
			_g->set_y(_g43);
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Player_obj,move,(void))

Void Player_obj::startJumping( ){
{
		HX_STACK_FRAME("Player","startJumping",0x99c6457f,"Player.startJumping","Player.hx",126,0xa27fc9dd)
		HX_STACK_THIS(this)
		HX_STACK_LINE(127)
		this->ySpeed = (int)-10;
		HX_STACK_LINE(128)
		this->isJumping = true;
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Player_obj,startJumping,(void))

Void Player_obj::jumpController( ){
{
		HX_STACK_FRAME("Player","jumpController",0x4e0f0577,"Player.jumpController","Player.hx",136,0xa27fc9dd)
		HX_STACK_THIS(this)
		HX_STACK_LINE(142)
		this->onTheGround = false;
		HX_STACK_LINE(143)
		{
			HX_STACK_LINE(143)
			int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(143)
			int _g = ::Global_obj::blocks->length;		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(143)
			while((true)){
				HX_STACK_LINE(143)
				if ((!(((_g1 < _g))))){
					HX_STACK_LINE(143)
					break;
				}
				HX_STACK_LINE(143)
				int i = (_g1)++;		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(144)
				Float _g2 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g2,"_g2");
				HX_STACK_LINE(144)
				Float _g11 = this->get_y();		HX_STACK_VAR(_g11,"_g11");
				HX_STACK_LINE(144)
				Float _g21 = (_g11 + this->ySpeed);		HX_STACK_VAR(_g21,"_g21");
				HX_STACK_LINE(144)
				Float _g3 = (_g21 + this->gravity);		HX_STACK_VAR(_g3,"_g3");
				HX_STACK_LINE(144)
				Float _g4 = this->get_height();		HX_STACK_VAR(_g4,"_g4");
				HX_STACK_LINE(144)
				Float _g5 = (_g3 + _g4);		HX_STACK_VAR(_g5,"_g5");
				struct _Function_3_1{
					inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
						HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",145,0xa27fc9dd)
						{
							HX_STACK_LINE(145)
							Float _g6 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g6,"_g6");
							HX_STACK_LINE(145)
							Float _g7 = __this->get_y();		HX_STACK_VAR(_g7,"_g7");
							HX_STACK_LINE(145)
							return (_g6 > _g7);
						}
						return null();
					}
				};
				struct _Function_3_2{
					inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
						HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",146,0xa27fc9dd)
						{
							HX_STACK_LINE(146)
							Float _g8 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g8,"_g8");
							HX_STACK_LINE(146)
							Float _g9 = __this->get_x();		HX_STACK_VAR(_g9,"_g9");
							HX_STACK_LINE(146)
							Float _g10 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_width();		HX_STACK_VAR(_g10,"_g10");
							HX_STACK_LINE(146)
							Float _g111 = (_g9 - _g10);		HX_STACK_VAR(_g111,"_g111");
							HX_STACK_LINE(146)
							return (_g8 > _g111);
						}
						return null();
					}
				};
				struct _Function_3_3{
					inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
						HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",147,0xa27fc9dd)
						{
							HX_STACK_LINE(147)
							Float _g12 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g12,"_g12");
							HX_STACK_LINE(147)
							Float _g13 = __this->get_x();		HX_STACK_VAR(_g13,"_g13");
							HX_STACK_LINE(147)
							Float _g14 = __this->get_width();		HX_STACK_VAR(_g14,"_g14");
							HX_STACK_LINE(147)
							Float _g15 = (_g13 + _g14);		HX_STACK_VAR(_g15,"_g15");
							HX_STACK_LINE(147)
							return (_g12 < _g15);
						}
						return null();
					}
				};
				HX_STACK_LINE(144)
				if (((  (((  (((  (((_g2 <= _g5))) ? bool(_Function_3_1::Block(i,this)) : bool(false) ))) ? bool(_Function_3_2::Block(i,this)) : bool(false) ))) ? bool(_Function_3_3::Block(i,this)) : bool(false) ))){
					HX_STACK_LINE(148)
					this->onTheGround = true;
					HX_STACK_LINE(149)
					this->groundBlock = i;
					HX_STACK_LINE(150)
					break;
				}
			}
		}
		HX_STACK_LINE(155)
		this->againstTheCeiling = false;
		HX_STACK_LINE(156)
		if (((this->ySpeed < (int)0))){
			HX_STACK_LINE(157)
			int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(157)
			int _g = ::Global_obj::blocks->length;		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(157)
			while((true)){
				HX_STACK_LINE(157)
				if ((!(((_g1 < _g))))){
					HX_STACK_LINE(157)
					break;
				}
				HX_STACK_LINE(157)
				int i = (_g1)++;		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(158)
				Float _g16 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g16,"_g16");
				HX_STACK_LINE(158)
				Float _g17 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_height();		HX_STACK_VAR(_g17,"_g17");
				HX_STACK_LINE(158)
				Float _g18 = (_g16 + _g17);		HX_STACK_VAR(_g18,"_g18");
				HX_STACK_LINE(158)
				Float _g19 = this->get_y();		HX_STACK_VAR(_g19,"_g19");
				HX_STACK_LINE(158)
				Float _g20 = (_g19 + this->ySpeed);		HX_STACK_VAR(_g20,"_g20");
				HX_STACK_LINE(158)
				Float _g21 = (_g20 + this->gravity);		HX_STACK_VAR(_g21,"_g21");
				struct _Function_3_1{
					inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
						HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",159,0xa27fc9dd)
						{
							HX_STACK_LINE(159)
							Float _g22 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g22,"_g22");
							HX_STACK_LINE(159)
							Float _g23 = __this->get_y();		HX_STACK_VAR(_g23,"_g23");
							HX_STACK_LINE(159)
							return (_g22 < _g23);
						}
						return null();
					}
				};
				struct _Function_3_2{
					inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
						HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",160,0xa27fc9dd)
						{
							HX_STACK_LINE(160)
							Float _g24 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g24,"_g24");
							HX_STACK_LINE(160)
							Float _g25 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_width();		HX_STACK_VAR(_g25,"_g25");
							HX_STACK_LINE(160)
							Float _g26 = (_g24 + _g25);		HX_STACK_VAR(_g26,"_g26");
							HX_STACK_LINE(160)
							Float _g27 = __this->get_x();		HX_STACK_VAR(_g27,"_g27");
							HX_STACK_LINE(160)
							return (_g26 > _g27);
						}
						return null();
					}
				};
				struct _Function_3_3{
					inline static bool Block( int &i,hx::ObjectPtr< ::Player_obj > __this){
						HX_STACK_FRAME("*","closure",0x5bdab937,"*.closure","Player.hx",161,0xa27fc9dd)
						{
							HX_STACK_LINE(161)
							Float _g28 = ::Global_obj::blocks->__get(i).StaticCast< ::Block >()->get_x();		HX_STACK_VAR(_g28,"_g28");
							HX_STACK_LINE(161)
							Float _g29 = __this->get_x();		HX_STACK_VAR(_g29,"_g29");
							HX_STACK_LINE(161)
							Float _g30 = __this->get_width();		HX_STACK_VAR(_g30,"_g30");
							HX_STACK_LINE(161)
							Float _g31 = (_g29 + _g30);		HX_STACK_VAR(_g31,"_g31");
							HX_STACK_LINE(161)
							return (_g28 < _g31);
						}
						return null();
					}
				};
				HX_STACK_LINE(158)
				if (((  (((  (((  (((_g18 >= _g21))) ? bool(_Function_3_1::Block(i,this)) : bool(false) ))) ? bool(_Function_3_2::Block(i,this)) : bool(false) ))) ? bool(_Function_3_3::Block(i,this)) : bool(false) ))){
					HX_STACK_LINE(162)
					this->againstTheCeiling = true;
					HX_STACK_LINE(163)
					this->ceilingBlock = i;
					HX_STACK_LINE(164)
					::haxe::Log_obj::trace(HX_CSTRING("against the ceiling"),hx::SourceInfo(HX_CSTRING("Player.hx"),164,HX_CSTRING("Player"),HX_CSTRING("jumpController")));
					HX_STACK_LINE(165)
					break;
				}
			}
		}
		HX_STACK_LINE(170)
		if (((bool(this->onTheGround) || bool(this->againstTheCeiling)))){
			HX_STACK_LINE(171)
			if ((this->onTheGround)){
				HX_STACK_LINE(173)
				this->ySpeed = (int)0;
				HX_STACK_LINE(174)
				Float _g32 = ::Global_obj::blocks->__get(this->groundBlock).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g32,"_g32");
				HX_STACK_LINE(174)
				Float _g33 = this->get_height();		HX_STACK_VAR(_g33,"_g33");
				HX_STACK_LINE(174)
				Float _g34 = (_g32 - _g33);		HX_STACK_VAR(_g34,"_g34");
				HX_STACK_LINE(174)
				this->set_y(_g34);
				HX_STACK_LINE(175)
				this->isJumping = false;
			}
			HX_STACK_LINE(177)
			if ((this->againstTheCeiling)){
				HX_STACK_LINE(178)
				this->ySpeed = (int)0;
				HX_STACK_LINE(179)
				Float _g35 = ::Global_obj::blocks->__get(this->ceilingBlock).StaticCast< ::Block >()->get_y();		HX_STACK_VAR(_g35,"_g35");
				HX_STACK_LINE(179)
				Float _g36 = ::Global_obj::blocks->__get(this->ceilingBlock).StaticCast< ::Block >()->get_height();		HX_STACK_VAR(_g36,"_g36");
				HX_STACK_LINE(179)
				Float _g37 = (_g35 + _g36);		HX_STACK_VAR(_g37,"_g37");
				HX_STACK_LINE(179)
				this->set_y(_g37);
				HX_STACK_LINE(180)
				::haxe::Log_obj::trace(HX_CSTRING("ouch"),hx::SourceInfo(HX_CSTRING("Player.hx"),180,HX_CSTRING("Player"),HX_CSTRING("jumpController")));
			}
		}
		else{
			HX_STACK_LINE(183)
			hx::AddEq(this->ySpeed,this->gravity);
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(Player_obj,jumpController,(void))


Player_obj::Player_obj()
{
}

Dynamic Player_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"i") ) { return i; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"move") ) { return move_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"xSpeed") ) { return xSpeed; }
		if (HX_FIELD_EQ(inName,"ySpeed") ) { return ySpeed; }
		if (HX_FIELD_EQ(inName,"update") ) { return update_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"gravity") ) { return gravity; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"moveView") ) { return moveView_dyn(); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"maxXSpeed") ) { return maxXSpeed; }
		if (HX_FIELD_EQ(inName,"maxYSpeed") ) { return maxYSpeed; }
		if (HX_FIELD_EQ(inName,"isJumping") ) { return isJumping; }
		if (HX_FIELD_EQ(inName,"moveViewX") ) { return moveViewX; }
		if (HX_FIELD_EQ(inName,"moveViewY") ) { return moveViewY; }
		if (HX_FIELD_EQ(inName,"wallBlock") ) { return wallBlock; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"againstWall") ) { return againstWall; }
		if (HX_FIELD_EQ(inName,"onTheGround") ) { return onTheGround; }
		if (HX_FIELD_EQ(inName,"groundBlock") ) { return groundBlock; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"startJumping") ) { return startJumping_dyn(); }
		if (HX_FIELD_EQ(inName,"ceilingBlock") ) { return ceilingBlock; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"jumpController") ) { return jumpController_dyn(); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"againstTheCeiling") ) { return againstTheCeiling; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Player_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 1:
		if (HX_FIELD_EQ(inName,"i") ) { i=inValue.Cast< int >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"xSpeed") ) { xSpeed=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"ySpeed") ) { ySpeed=inValue.Cast< Float >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"gravity") ) { gravity=inValue.Cast< Float >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"maxXSpeed") ) { maxXSpeed=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"maxYSpeed") ) { maxYSpeed=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"isJumping") ) { isJumping=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"moveViewX") ) { moveViewX=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"moveViewY") ) { moveViewY=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"wallBlock") ) { wallBlock=inValue.Cast< int >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"againstWall") ) { againstWall=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"onTheGround") ) { onTheGround=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"groundBlock") ) { groundBlock=inValue.Cast< int >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"ceilingBlock") ) { ceilingBlock=inValue.Cast< int >(); return inValue; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"againstTheCeiling") ) { againstTheCeiling=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Player_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("xSpeed"));
	outFields->push(HX_CSTRING("ySpeed"));
	outFields->push(HX_CSTRING("maxXSpeed"));
	outFields->push(HX_CSTRING("maxYSpeed"));
	outFields->push(HX_CSTRING("i"));
	outFields->push(HX_CSTRING("gravity"));
	outFields->push(HX_CSTRING("isJumping"));
	outFields->push(HX_CSTRING("moveViewX"));
	outFields->push(HX_CSTRING("moveViewY"));
	outFields->push(HX_CSTRING("againstWall"));
	outFields->push(HX_CSTRING("wallBlock"));
	outFields->push(HX_CSTRING("onTheGround"));
	outFields->push(HX_CSTRING("groundBlock"));
	outFields->push(HX_CSTRING("againstTheCeiling"));
	outFields->push(HX_CSTRING("ceilingBlock"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

#if HXCPP_SCRIPTABLE
static hx::StorageInfo sMemberStorageInfo[] = {
	{hx::fsFloat,(int)offsetof(Player_obj,xSpeed),HX_CSTRING("xSpeed")},
	{hx::fsFloat,(int)offsetof(Player_obj,ySpeed),HX_CSTRING("ySpeed")},
	{hx::fsFloat,(int)offsetof(Player_obj,maxXSpeed),HX_CSTRING("maxXSpeed")},
	{hx::fsFloat,(int)offsetof(Player_obj,maxYSpeed),HX_CSTRING("maxYSpeed")},
	{hx::fsInt,(int)offsetof(Player_obj,i),HX_CSTRING("i")},
	{hx::fsFloat,(int)offsetof(Player_obj,gravity),HX_CSTRING("gravity")},
	{hx::fsBool,(int)offsetof(Player_obj,isJumping),HX_CSTRING("isJumping")},
	{hx::fsFloat,(int)offsetof(Player_obj,moveViewX),HX_CSTRING("moveViewX")},
	{hx::fsFloat,(int)offsetof(Player_obj,moveViewY),HX_CSTRING("moveViewY")},
	{hx::fsBool,(int)offsetof(Player_obj,againstWall),HX_CSTRING("againstWall")},
	{hx::fsInt,(int)offsetof(Player_obj,wallBlock),HX_CSTRING("wallBlock")},
	{hx::fsBool,(int)offsetof(Player_obj,onTheGround),HX_CSTRING("onTheGround")},
	{hx::fsInt,(int)offsetof(Player_obj,groundBlock),HX_CSTRING("groundBlock")},
	{hx::fsBool,(int)offsetof(Player_obj,againstTheCeiling),HX_CSTRING("againstTheCeiling")},
	{hx::fsInt,(int)offsetof(Player_obj,ceilingBlock),HX_CSTRING("ceilingBlock")},
	{ hx::fsUnknown, 0, null()}
};
#endif

static ::String sMemberFields[] = {
	HX_CSTRING("xSpeed"),
	HX_CSTRING("ySpeed"),
	HX_CSTRING("maxXSpeed"),
	HX_CSTRING("maxYSpeed"),
	HX_CSTRING("i"),
	HX_CSTRING("gravity"),
	HX_CSTRING("isJumping"),
	HX_CSTRING("update"),
	HX_CSTRING("moveViewX"),
	HX_CSTRING("moveViewY"),
	HX_CSTRING("moveView"),
	HX_CSTRING("againstWall"),
	HX_CSTRING("wallBlock"),
	HX_CSTRING("move"),
	HX_CSTRING("startJumping"),
	HX_CSTRING("onTheGround"),
	HX_CSTRING("groundBlock"),
	HX_CSTRING("againstTheCeiling"),
	HX_CSTRING("ceilingBlock"),
	HX_CSTRING("jumpController"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Player_obj::__mClass,"__mClass");
};

#ifdef HXCPP_VISIT_ALLOCS
static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Player_obj::__mClass,"__mClass");
};

#endif

Class Player_obj::__mClass;

void Player_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Player"), hx::TCanCast< Player_obj> ,sStaticFields,sMemberFields,
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

void Player_obj::__boot()
{
}

